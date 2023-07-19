package com.hubei.service.impl;

import com.hubei.dao.CurriculumMapper;
import com.hubei.pojo.Curriculum;
import com.hubei.service.CurriculumService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CurriculumServiceImpl implements CurriculumService {
    @Resource
    private CurriculumMapper curriculumMapper;

    @Override
    public List<Curriculum> selectCurriculumsByClass(String className) {
        return curriculumMapper.selectCoursesByClass(className);
    }

    @Override
    public List<Curriculum> selectAllCurriculums() {
        return curriculumMapper.selectAllCurriculums();
    }

    @Override
    public List<Curriculum> conditionQueryCurriculum(Integer cNo, String cName, String teacher, String teachTime) {
        return curriculumMapper.conditionQueryCurriculum(cNo, cName, teacher, teachTime);
    }

    @Override
    public List<Curriculum> getCurriculumsByTeacher(String name) {
        return curriculumMapper.selectByTeacher(name);
    }

    @Override
    public List<Curriculum> selectByCno(String cNo) {
        return curriculumMapper.selectByCno(cNo);
    }

    @Override
    public Integer addCu(Curriculum curriculum) {
        Integer count = curriculumMapper.selectTeacherNumByClass(curriculum.getClassName(), curriculum.getTeacher());
        System.out.println(count);
        return curriculumMapper.addCu(curriculum);
    }

    @Override
    public Integer deleteCu(String id) {
        return curriculumMapper.deleteCu(id);
    }

    @Override
    public Integer updateCu(Curriculum curriculum) {
        return curriculumMapper.updateCu(curriculum);
    }

    @Override
    public List<Curriculum> selectCurriByClassName(String stuClass) {

        return curriculumMapper.selectCurriByClassName(stuClass);
    }
}
