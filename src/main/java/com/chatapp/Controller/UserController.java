package com.chatapp.Controller;

import com.chatapp.Data.Role;
import com.chatapp.Data.User;
import com.chatapp.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserService usrService;

    @GetMapping
    public String usersList(Model model) {
        model.addAttribute("usr_list", usrService.findAll());
        return "users";
    }

    @GetMapping("/{user}")
    public String editUser(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEditor";
    }

    @PostMapping("/{id}")
    public String confirmEdit(@PathVariable("id") User user, @RequestParam String username,
                              @RequestParam String password, @RequestParam Map<String, String> roles) {
        usrService.save(user, username, password, roles);
        return "redirect:/users";
    }
}
