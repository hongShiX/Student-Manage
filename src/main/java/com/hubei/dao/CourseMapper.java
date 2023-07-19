package com.hubei.dao;

import com.hubei.pojo.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {
    List<Course> selectAllCourses();

    List<Course> conditionQueryCourses(@Param("cNo") Integer cNo, @Param("cName") String cName);

    Integer addCourse(Course course);

    Integer deleteCourse(String course);

    Integer updateCourse(Course course);
}
