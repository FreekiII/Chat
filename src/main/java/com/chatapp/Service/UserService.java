package com.chatapp.Service;

import com.chatapp.Data.Role;
import com.chatapp.Data.User;
import com.chatapp.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void save(User user, String username, String password, Map<String, String> roles, boolean is_blocked) {
        if (!username.isEmpty()) {
            user.setUsername(username);
        }

        if (!password.isEmpty()) {
            user.setPassword(password);
        }

        user.getRoles().clear();
        Set<String> rolesSet = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        for (String key : roles.keySet()) {
            if (rolesSet.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        if (!user.isActive()) {
            user.setActive(true);
        }

        user.setBlocked(is_blocked);

        userRepo.save(user);
    }

    public void update(User user, String username, String password, boolean is_blocked) {
        if (!username.isEmpty()) {
            user.setUsername(username);
        }

        if (!password.isEmpty()) {
            user.setPassword(password);
        }

        if (!user.isActive()) {
            user.setActive(true);
        }

        user.setBlocked(is_blocked);

        userRepo.save(user);
    }

    public void update(User user, boolean is_blocked) {
        if (!user.isActive()) {
            user.setActive(true);
        }

        user.setBlocked(is_blocked);

        userRepo.save(user);
    }
}
