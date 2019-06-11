package com.chatapp.Controller;

import com.chatapp.Data.User;
import com.chatapp.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
public class ProfileController {
    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public String getProfile(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", user.getPassword());
        return "profile";
    }

    @PostMapping("/profile")
    public String changeProfile(@AuthenticationPrincipal User user,
                                @RequestParam String username, @RequestParam String password) {

        userService.update(user, username, password);
        return "redirect:/profile";
    }
}
