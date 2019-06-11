package com.chatapp.Controller;

import com.chatapp.Data.Message;
import com.chatapp.Data.User;
import com.chatapp.Repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class ChatController {
    @Autowired
    private MessageRepository msgRepo;

    @GetMapping("/chat")
    public String getMainPage(Model model) {
        model.addAttribute("messages", msgRepo.findAll());
        model.addAttribute("CRUTCH", LocalDateTime.now());
        return "chat";
    }

    @PostMapping("/chat")
    public String sendMessage(@AuthenticationPrincipal User user,
                              @RequestParam String userMsg) {
        msgRepo.save(new Message(userMsg, user));
        return "redirect:/chat";
    }
}
