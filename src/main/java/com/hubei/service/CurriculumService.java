package com.hubei.service;

import com.hubei.pojo.Curriculum;
import com.hubei.pojo.Teacher;

import java.util.List;

public interface CurriculumService {
    List<Curriculum> selectCurriculumsByClass(String className);

    List<Curriculum> selectAllCurriculums();

    List<Curriculum> conditionQueryCurriculum(Integer cNo, String cName, String teacher, String teachTime);

    List<Curriculum> getCurriculumsByTeacher(String name);

    List<Curriculum> selectByCno(String cNo);

    Integer addCu(Curriculum curriculum);

    Integer deleteCu(String id);

    Integer updateCu(Curriculum curriculum);

    List<Curriculum> selectCurriByClassName(String stuClass);
}
