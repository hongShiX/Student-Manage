package com.hubei.service;

import com.hubei.pojo.Teacher;

import java.util.List;

public interface TeacherService {
    Teacher selectById(String id);

    List<Teacher> selectAllTeachers();

    List<Teacher> conditionQueryTeacherInfo(String id, String name, String dept);

    Integer addTeacher(Teacher teacher);

    Integer deleteTeacher(String id);

    Integer updateTeacher(Teacher teacher);
}
