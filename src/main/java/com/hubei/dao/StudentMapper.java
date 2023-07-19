package com.hubei.dao;

import com.hubei.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    Student selectById(String stuNo);

    List<Student> selectAllStudents();

    List<Student> conditionQuery(@Param("stuNo") String stuNo, @Param("stuName") String stuName);

    /**
     * 根据班级查找学生
     * @param stuClass
     * @return
     */

    List<Student> selectStuByClass(@Param("stuClass") String stuClass);

    Integer addStu(Student student);

    Integer deleteStu(@Param("stuNo") String stuNo);

    Integer updateStu(Student student);
}
