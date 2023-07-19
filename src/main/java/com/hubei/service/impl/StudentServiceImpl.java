package com.hubei.service.impl;

import com.hubei.dao.StudentMapper;
import com.hubei.pojo.Student;
import com.hubei.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;
    @Override
    public Student selectById(String stuId) {
        return studentMapper.selectById(stuId);
    }

    @Override
    public List<Student> selectAllStudents() {
        return studentMapper.selectAllStudents();
    }

    @Override
    public List<Student> conditionQuery(String stuNo, String stuName) {
        return studentMapper.conditionQuery(stuNo, stuName);
    }

    @Override
    public List<Student> selectStuByClass(String className) {
        return studentMapper.selectStuByClass(className);
    }

    @Override
    public Integer addStu(Student student) {
        return studentMapper.addStu(student);
    }

    @Override
    public Integer deleteStu(String stuNo) {
        return studentMapper.deleteStu(stuNo);
    }

    @Override
    public Integer updateStu(Student student) {
        return studentMapper.updateStu(student);
    }
}
