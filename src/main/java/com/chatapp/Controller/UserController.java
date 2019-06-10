package com.chatapp.Controller;

import com.chatapp.Data.Role;
import com.chatapp.Data.User;
import com.chatapp.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepository userRepo;

    @GetMapping
    public String usersList(Model model) {
        model.addAttribute("usr_list", userRepo.findAll());
        return "users";
    }

    @GetMapping("{user}")
    public String editUser(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEditor";
    }

    @PostMapping
    public String confirmEdit(@RequestParam("id") User user, @RequestParam String username,
                              @RequestParam String password, @RequestParam Map<String, String> roles) {
        user.setUsername(username);
        user.setPassword(password);

        user.getRoles().clear();
        Set<String> rolesSet = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        for (String key : roles.keySet()) {
            if (rolesSet.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
        return "redirect:/users";
    }
}
