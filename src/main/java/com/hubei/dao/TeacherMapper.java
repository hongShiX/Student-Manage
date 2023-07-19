package com.hubei.dao;

import com.hubei.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {

    /**
     * 根据id查找教师
     * @param id
     * @return
     */
    Teacher selectById(@Param("id") String id);

    List<Teacher> selectAllTeachers();

    List<Teacher> conditionQueryTeacherInfo(@Param("id") String id, @Param("name") String name, @Param("dept") String dept);

    Integer addTeacher(Teacher teacher);

    Integer deleteTeacher(@Param("id") String id);

    Integer updateTeacher(Teacher teacher);
}
