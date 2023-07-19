package com.hubei.service.impl;

import com.hubei.dao.CourseMapper;
import com.hubei.pojo.Course;
import com.hubei.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;

    @Override
    public List<Course> getAllCourses() {
        return courseMapper.selectAllCourses();
    }

    @Override
    public List<Course> conditionQueryCourses(Integer cNo, String cName) {
        return courseMapper.conditionQueryCourses(cNo, cName);
    }

    @Override
    public Integer addCourse(Course course) {
        return courseMapper.addCourse(course);
    }

    @Override
    public Integer deleteCourse(String course) {
        return courseMapper.deleteCourse(course);
    }

    @Override
    public Integer updateCourse(Course course) {
        return courseMapper.updateCourse(course);
    }
}
