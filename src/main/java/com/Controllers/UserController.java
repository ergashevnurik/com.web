package com.Controllers;


import com.Domain.Role;
import com.Domain.User;
import com.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        Page<User> page = userService.findAll();
        List<User> list = page.getContent();
            model.addAttribute("users", list);
        return "userList";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
            model.addAttribute("user", user);
            model.addAttribute("roles", Role.values());
        return "userEdit";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(@RequestParam String username, @RequestParam Map<String, String> form,
                           @RequestParam("userId") User user) {

        userService.saveUser(user, username, form);


        return "redirect:/user";
    }

    @GetMapping("/user")
    public String find(@RequestParam String filter, Model model) {
        userService.findByUserName(filter);
        model.addAttribute("filter", filter);
        return "userList";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        model.addAttribute("middleName", user.getMiddleName());
        model.addAttribute("city", user.getCity());
        model.addAttribute("district", user.getDistrict());
        model.addAttribute("nickname", user.getNickname());
        model.addAttribute("status", user.getStatus());
        model.addAttribute("age", user.getAge());
        return "profile";
    }
    @PostMapping("profile")
    public String updateProfile(@RequestParam String firstName,
                                @RequestParam String city,
                                @RequestParam String district,
                                @RequestParam String lastName,
                                @RequestParam String status,
                                @RequestParam Integer age,
                                @RequestParam String nickname,
                                @RequestParam String middleName,
                                @RequestParam String password,
                                @RequestParam String email,
                                @AuthenticationPrincipal User user) {

        userService.updateProfile(firstName, lastName, middleName, age, status, nickname, district, city, password, email, user);

        return "redirect:/user/profile";
    }
}
