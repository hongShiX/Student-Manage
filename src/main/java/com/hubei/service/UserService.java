package com.hubei.service;

import com.hubei.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    Integer deleteByUsername(String username);

    User login(User u);

    Integer updatePassword(String username, String currentPassword);

    List<User> getAllUsers();

    Integer addUser(User user);

    Integer updateUser(User user);
}
