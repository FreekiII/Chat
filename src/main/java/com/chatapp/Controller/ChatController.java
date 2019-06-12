package com.chatapp.Controller;

import com.chatapp.Data.Message;
import com.chatapp.Data.User;
import com.chatapp.Repository.MessageRepository;
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

    @GetMapping("/chat")
    public String getChat(Model model,
                          @AuthenticationPrincipal User user_now) {
        model.addAttribute("messages", msgRepo.findAll());
        model.addAttribute("CRUTCH", LocalDateTime.now());
        model.addAttribute("user_now", user_now);
        return "chat";
    }

    @PostMapping("/chat")
    public String sendMessage(@AuthenticationPrincipal User user,
                              @RequestParam String userMsg) {
        msgRepo.save(new Message(userMsg, user));
        return "redirect:/chat";
    }

    @PostMapping("/delete_msg")
    public String deleteMessage(@RequestParam String msg_id) {
        msgRepo.deleteById(Long.valueOf(msg_id));
        return "redirect:/chat";
    }
}
