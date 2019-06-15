package com.chatapp.Controller;

import com.chatapp.Data.Message;
import com.chatapp.Data.Room;
import com.chatapp.Data.User;
import com.chatapp.Repository.MessageRepository;
import com.chatapp.Repository.RoomRepository;
import com.chatapp.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
public class ChatController {
    @Autowired
    private MessageRepository msgRepo;

    @Autowired
    private RoomRepository roomRepo;

    @Autowired
    private UserService userService;

    @GetMapping("/chat")
    public String getChat(Model model,
                          @AuthenticationPrincipal User user_now) {
        model.addAttribute("user_now", user_now);
        model.addAttribute("rooms", roomRepo.findAll());
        return "chat";
    }

    @PostMapping("/create_room")
    public String createRoom(@RequestParam String room_name,
                             @RequestParam(required = false) boolean is_private,
                             @AuthenticationPrincipal User user) {
        roomRepo.save(new Room(room_name, user, is_private));
        return "redirect:/chat";
    }

    @GetMapping("/room/{id}")
    public String getRoom(@PathVariable("id") Room room, Model model,
                          @AuthenticationPrincipal User user_now) {
        model.addAttribute("room", room);
        model.addAttribute("user_now", user_now);
        model.addAttribute("messages", msgRepo.findByRoom(room));
        model.addAttribute("CRUTCH", LocalDateTime.now());
        model.addAttribute("user_list", room.getUser_list());
        model.addAttribute("all_users", userService.findAll());
        return "room";
    }

    @PostMapping("/room/{id}")
    public String sendMessage(@AuthenticationPrincipal User user,
                              @RequestParam String userMsg,
                              @PathVariable("id") Room room) {
        msgRepo.save(new Message(userMsg, user, room));
        return "redirect:/room/{id}";
    }

    @PostMapping("/room/{id}/delete_msg")
    public String deleteMessage(@RequestParam String msg_id,
                                @PathVariable("id") Room room) {
        msgRepo.deleteById(Long.valueOf(msg_id));
        return "redirect:/room/{id}";
    }


    @PostMapping("/room/{id}/add_user")
    public String addUserToChat(@RequestParam String username,
                                @PathVariable("id") Room room) {
        room.addUser(userService.findByUsername(username));
        roomRepo.save(room);
        return "redirect:/room/{id}";
    }

    @PostMapping("/room/{id}/delete_user")
    public String deleteUserToChat(@RequestParam String username,
                                   @PathVariable("id") Room room) {
        room.deleteUser(userService.findByUsername(username));
        roomRepo.save(room);
        return "redirect:/room/{id}";
    }

    @PostMapping("/room/{id}/rename")
    public String renameRoom(@RequestParam String new_name,
                             @PathVariable("id") Room room) {
        room.setName(new_name);
        roomRepo.save(room);
        return "redirect:/room/{id}";
    }

    @PostMapping("/room/{id}/delete")
    public String deleteRoom(@PathVariable("id") Room room) {
        roomRepo.delete(room);
        return "redirect:/chat";
    }
}
