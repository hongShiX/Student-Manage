package com.hubei.service.impl;

import com.hubei.dao.TeacherMapper;
import com.hubei.pojo.Teacher;
import com.hubei.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private TeacherMapper teacherMapper;
    @Override
    public Teacher selectById(String id) {
        return teacherMapper.selectById(id);
    }

    @Override
    public List<Teacher> selectAllTeachers() {
        return teacherMapper.selectAllTeachers();
    }

    @Override
    public List<Teacher> conditionQueryTeacherInfo(String id, String name, String dept) {
        return teacherMapper.conditionQueryTeacherInfo(id, name, dept);
    }

    @Override
    public Integer addTeacher(Teacher teacher) {
        return teacherMapper.addTeacher(teacher);
    }

    @Override
    public Integer deleteTeacher(String id) {
        return teacherMapper.deleteTeacher(id);
    }

    @Override
    public Integer updateTeacher(Teacher teacher) {
        return teacherMapper.updateTeacher(teacher);
    }
}
