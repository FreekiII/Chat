package com.chatapp.Controller;

import com.chatapp.Data.Role;
import com.chatapp.Data.User;
import com.chatapp.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('MODERATOR')")
public class UserController {
    @Autowired
    private UserService usrService;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("usr_list", usrService.findAll());
        return "users";
    }

    @GetMapping("/{user}")
    public String editUser(@PathVariable User user, Model model,
                           @AuthenticationPrincipal User user_now) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        model.addAttribute("user_now", user_now);
        return "userEditor";
    }

    @PostMapping("/{id}")
    public String confirmEdit(@PathVariable("id") User user,
                              @AuthenticationPrincipal User user_now,
                              @RequestParam(required = false) String username,
                              @RequestParam(required = false) String password,
                              @RequestParam(required = false) Map<String, String> roles,
                              @RequestParam(required = false) boolean is_blocked) {
        if (user_now.isAdmin()) {
            usrService.save(user, username, password, roles, is_blocked);
        } else {
            usrService.update(user, is_blocked);
        }
        return "redirect:/users";
    }
}
