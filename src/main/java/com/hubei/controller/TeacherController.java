package com.hubei.controller;

import com.hubei.pojo.Teacher;
import com.hubei.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {
    @Resource
    private TeacherService teacherService;

    @GetMapping("/teacherInfo")
    @ResponseBody
    public List<Teacher> getAllTeachers() {
        return teacherService.selectAllTeachers();
    }

    @GetMapping("/teacherSelfInfo")
    @ResponseBody
    public Teacher getMyInfo(String id) {
        return teacherService.selectById(id);
    }

    @PostMapping("/conditionQueryTeacherInfo")
    @ResponseBody
    public List<Teacher> conditionQueryTeacherInfo(@RequestBody Teacher teacher) {
        return teacherService.conditionQueryTeacherInfo(teacher.getId(), teacher.getName(), teacher.getDept());
    }

    @PostMapping("/addTeacher")
    @ResponseBody
    public Integer addTeacher(@RequestBody Teacher teacher) {
        return teacherService.addTeacher(teacher);
    }

    @PostMapping("/deleteTeacher")
    @ResponseBody
    public Integer deleteTeacher(@RequestBody Map<String, String> map) {
        String id = map.get("id");
        return teacherService.deleteTeacher(id);
    }

    @PostMapping("/updateTeacher")
    @ResponseBody
    public Integer updateTeacher(@RequestBody Teacher teacher) {
        return teacherService.updateTeacher(teacher);
    }
}
