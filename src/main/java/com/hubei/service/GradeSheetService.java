package com.hubei.service;

import com.hubei.pojo.GradeSheet;

import java.util.List;

public interface GradeSheetService {
    List<GradeSheet> selectGradesByStuNo(String stuNo);

    List<GradeSheet> selectAllSheets();

    List<GradeSheet> conditionQuerySheets(Integer stuNo, Integer cNo, Double minGrade, Double maxGrade);

    Integer insertScore(GradeSheet gradeSheet);

    Integer deleteGrade(String stuNo, String cNo);

    Integer updateScore(String stuNo, String cNo, Double grade);

    List<GradeSheet> getMyCScore(String name);
}
