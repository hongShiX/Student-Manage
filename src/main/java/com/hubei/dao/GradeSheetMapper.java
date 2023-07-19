package com.hubei.dao;

import com.hubei.pojo.GradeSheet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeSheetMapper {
    List<GradeSheet> selectGradesByStuNo(String stuNo);

    List<GradeSheet> selectAllSheets();

    List<GradeSheet> conditionQuerySheets(@Param("stuNo") Integer stuNo, @Param("cNo") Integer cNo, @Param("minGrade") Double minGrade, @Param("maxGrade") Double maxGrade);

    /**
     * 添加成绩
     * @return
     */
    Integer addScore(GradeSheet gradeSheet);

    Integer deleteGrade(@Param("stuNo") String stuNo, @Param("cNo") String cNo);

    Integer updateScore(@Param("stuNo") String stuNo, @Param("cNo") String cNo, @Param("grade") Double grade);

    List<GradeSheet> getMyCScore(String name);
}
