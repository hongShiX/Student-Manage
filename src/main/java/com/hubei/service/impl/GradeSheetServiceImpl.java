package com.hubei.service.impl;

import com.hubei.dao.GradeSheetMapper;
import com.hubei.pojo.GradeSheet;
import com.hubei.service.GradeSheetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GradeSheetServiceImpl implements GradeSheetService {
    @Resource
    private GradeSheetMapper gradeSheetMapper;
    @Override
    public List<GradeSheet> selectGradesByStuNo(String stuNo) {
        return gradeSheetMapper.selectGradesByStuNo(stuNo);
    }

    @Override
    public List<GradeSheet> selectAllSheets() {
        return gradeSheetMapper.selectAllSheets();
    }

    @Override
    public List<GradeSheet> conditionQuerySheets(Integer stuNo, Integer cNo, Double minGrade, Double maxGrade) {
        return gradeSheetMapper.conditionQuerySheets(stuNo, cNo, minGrade, maxGrade);
    }

    @Override
    public Integer insertScore(GradeSheet gradeSheet) {
        return gradeSheetMapper.addScore(gradeSheet);
    }

    @Override
    public Integer deleteGrade(String stuNo, String cNo) {
        return gradeSheetMapper.deleteGrade(stuNo, cNo);
    }

    @Override
    public Integer updateScore(String stuNo, String cNo, Double grade) {
        return gradeSheetMapper.updateScore(stuNo, cNo, grade);
    }

    @Override
    public List<GradeSheet> getMyCScore(String name) {
        return gradeSheetMapper.getMyCScore(name);
    }
}
