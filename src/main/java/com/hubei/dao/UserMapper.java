package com.hubei.dao;

import com.hubei.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    User selectUserByNP(User u);

    Integer updatePassword(@Param("username") String username, @Param("currentPassword") String currentPassword);

    List<User> selectAllUsers();

    Integer addUser(User user);


    Integer deleteByUsername(String username);

    Integer updateUser(User user);
}
