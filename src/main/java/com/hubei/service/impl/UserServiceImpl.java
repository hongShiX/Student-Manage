package com.hubei.service.impl;


import com.hubei.dao.UserMapper;
import com.hubei.pojo.User;
import com.hubei.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User login(User u) {
        return userMapper.selectUserByNP(u);
    }

    @Override
    public Integer updatePassword(String username, String currentPassword) {
        return userMapper.updatePassword(username, currentPassword);
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.selectAllUsers();
    }

    @Override
    public Integer addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public Integer deleteByUsername(String username) {
        return userMapper.deleteByUsername(username);
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateUser(user);
    }
}
