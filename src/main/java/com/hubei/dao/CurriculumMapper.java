package com.hubei.dao;

import com.hubei.pojo.Curriculum;
import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;


public interface CurriculumMapper {
    /**
     * 根据班级名查找
     * @param className
     * @return
     */
    List<Curriculum> selectCoursesByClass(@Param("className") String className);

    List<Curriculum> selectAllCurriculums();

    List<Curriculum> conditionQueryCurriculum(@Param("cNo") Integer cNo, @Param("cName") String cName, @Param("teacher") String teacher, @Param("teachTime")  @DateTimeFormat(pattern = "yyyy-MM-dd") String teachTime);

    /**
     * 根据教师查找课程表
     * @param name
     * @return
     */
    List<Curriculum> selectByTeacher(@Param("name") String name);

    List<Curriculum> selectByCno(@Param("cNo") String cNo);

    Integer addCu(Curriculum curriculum);

    Integer deleteCu(@Param("id") String id);

    Integer updateCu(Curriculum curriculum);

    List<Curriculum> selectCurriByClassName(String stuClass);

    Integer selectTeacherNumByClass(@Param("className") String className, @Param("teacher") String teacher);
}
