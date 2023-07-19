package com.hubei.service;

import com.hubei.pojo.Course;

import java.util.List;

public interface CourseService {
    List<Course> getAllCourses();

    List<Course> conditionQueryCourses(Integer cNo, String cName);

    Integer addCourse(Course course);

    Integer deleteCourse(String course);

    Integer updateCourse(Course course);
}
