package com.hubei.controller;

import com.hubei.pojo.Student;
import com.hubei.service.StudentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
public class StudentController {
    @Resource
    private StudentService studentService;

    @GetMapping("/baseInfo")
    @ResponseBody
    public List<Student> getBaseInfo() {
        return studentService.selectAllStudents();
    }

    @GetMapping ("/conditionQuery")
    @ResponseBody
    public List<Student> conditionQuery(String stuNo, String stuName) {
        return studentService.conditionQuery(stuNo, stuName);
    }

    @GetMapping("/selectStuByClass")
    @ResponseBody
    public List<Student> selectStuByClass(String className) {
        return studentService.selectStuByClass(className);
    }

    @PostMapping("/addStu")
    @ResponseBody
    public Integer addStu(@RequestBody Student student) {
        return studentService.addStu(student);
    }

    @PostMapping("/deleteStu")
    @ResponseBody
    public Integer deleteStu(@RequestBody Map<String, Object> map) {
        String stuNo = (String)map.get("stuNo");
        return studentService.deleteStu(stuNo);
    }

    @PostMapping("/updateStu")
    @ResponseBody
    public Integer updateStu(@RequestBody Student student) {
        return studentService.updateStu(student);
    }

    @GetMapping("/selectById")
    @ResponseBody
    public Student selectByNo(String stuNo) {
        return studentService.selectById(stuNo);
    }
}
