package com.hubei.controller;

import com.hubei.pojo.Course;
import com.hubei.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class CourseController {
    @Resource
    private CourseService courseService;

    @GetMapping("/getCourseInfo")
    @ResponseBody
    public List<Course> getAllCourses() {
        return courseService.getAllCourses();
    }

    @PostMapping("/conditionQueryCourses")
    @ResponseBody
    public List<Course> conditionQueryCourses(@RequestBody Course course) {
        return courseService.conditionQueryCourses(course.getCNo(), course.getCName());
    }

    @PostMapping("/addCourse")
    @ResponseBody
    public Integer addCourse(@RequestBody Course course) {
        return courseService.addCourse(course);
    }

    @PostMapping("/deleteCourse")
    @ResponseBody
    public Integer deleteCourse(@RequestBody Map<String, String> map) {
        String course = map.get("cNo");
        return courseService.deleteCourse(course);
    }

    @PostMapping("/updateCourse")
    @ResponseBody
    public Integer updateCourse(@RequestBody Course course) {
        return courseService.updateCourse(course);
    }
}
