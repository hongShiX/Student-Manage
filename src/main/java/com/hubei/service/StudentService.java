package com.hubei.service;

import com.hubei.pojo.Student;

import java.util.List;

public interface StudentService {
    Student selectById(String stuNo);

    List<Student> selectAllStudents();

    List<Student> conditionQuery(String stuNo, String stuName);

    List<Student> selectStuByClass(String className);

    Integer addStu(Student student);

    Integer deleteStu(String stuNo);

    Integer updateStu(Student student);
}
