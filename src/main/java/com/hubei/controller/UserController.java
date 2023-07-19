package com.hubei.controller;

import com.hubei.pojo.Student;
import com.hubei.pojo.Teacher;
import com.hubei.pojo.User;
import com.hubei.service.StudentService;
import com.hubei.service.TeacherService;
import com.hubei.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private TeacherService teacherService;

    @Resource
    private StudentService studentService;

    @PostMapping("/login")
    public String UserController(String username, String password, Model model, HttpSession session) {
        User u = new User(username, password, null);
        User user = userService.login(u);
        if (user != null) {
//            model.addAttribute("user", user);
            session.setAttribute("user", user);
            if (user.getUserType().equals(User.USER_STUDENT)) {
                // 学生以学号作为用户名，用用户名查询学生的基本信息
                Student student = studentService.selectById(user.getUsername());
                model.addAttribute("stu", student);
                return "stu-info";
            } else if (user.getUserType().equals(User.USER_MANAGER)) {
                model.addAttribute("manager", username);
                return "manager-info";
            } else if (user.getUserType().equals(User.USER_TEACHER)) {
                Teacher teacher = teacherService.selectById(user.getUsername());
                model.addAttribute("teacher", teacher);
                return "teacher-info";
            }

        }
        return "error";
    }

    @RequestMapping("/modifyPassword")
    public String modifyPassword(String username, String prevPassword, String current1, String current2) {
        if (current1.equals(prevPassword)) {
            return "error";
        }
        if (current1.equals(current2)) {
            User login = userService.login(new User(username, prevPassword, null));
            if (login != null) {
                Integer i = userService.updatePassword(username, current1);
                if (i == 1) {
                    return "transit";
                }
            }
        }
        return "error";
    }

    @GetMapping("/getAllUsers")
    @ResponseBody
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @PostMapping("/addUser")
    @ResponseBody
    public Integer addUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    @PostMapping("/deleteUser")
    @ResponseBody
    public Integer deleteUserByUsername(@RequestBody Map<String, String> map) {
        String username = map.get("username");
        return userService.deleteByUsername(username);
    }

    @PostMapping("/updateUser")
    @ResponseBody
    public Integer updateUser(@RequestBody User user) {
        return userService.updateUser(user);
    }
}
