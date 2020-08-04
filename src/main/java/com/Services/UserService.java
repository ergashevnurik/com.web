package com.Services;

import com.Domain.Role;
import com.Domain.User;
import com.Repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(s);

        if (user == null) {
            throw new UsernameNotFoundException("User not Found");
        }

        return user;
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);

        sendMessage(user);

        return true;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s\n" +
                            "Welcome To Web Page. Please visit through link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation Code", message);
        }
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        user.getRoles().clear();

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public void findByUserName(String filter) {
        User user = (User) userRepo.findAll();
        if (filter != null && !filter.isEmpty()) {
            user = userRepo.findByUsername(filter);
        } else {
            user = (User) userRepo.findAll();
        }
    }

    public void updateProfile(String firstName, String lastName, String middleName, Integer age,
                              String status, String nickname,
                              String district, String city,
                              String password, String email, User user) {
        String userEmail = user.getEmail();
        boolean isEmailChanged = ((email != null && !email.equals(userEmail))
                || (userEmail != null && !userEmail.equals(email)));

        if (isEmailChanged) {
            user.setEmail(email);
            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }
        if (!StringUtils.isEmpty(password)) {
            user.setPassword(password);
        }
        if (!StringUtils.isEmpty(firstName) &&
                !StringUtils.isEmpty(firstName) &&
                    !StringUtils.isEmpty(firstName) &&
                        !StringUtils.isEmpty(district) &&
                            !StringUtils.isEmpty(nickname) &&
                                !StringUtils.isEmpty(age) &&
                                    !StringUtils.isEmpty(nickname) &&
                                        !StringUtils.isEmpty(city)) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setMiddleName(middleName);
            user.setCity(city);
            user.setDistrict(district);
            user.setNickname(nickname);
            user.setAge(age);
            user.setStatus(status);
        }
        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }

    }
}
