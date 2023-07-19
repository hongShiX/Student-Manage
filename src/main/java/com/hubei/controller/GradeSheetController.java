package com.hubei.controller;

import com.hubei.pojo.GradeSheet;
import com.hubei.service.GradeSheetService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class GradeSheetController {
    @Resource
    private GradeSheetService gradeSheetService;

    @RequestMapping("/getScore")
    @ResponseBody
    public List<GradeSheet> getGradeSheetsByStuNo(String stuNo) {
        return gradeSheetService.selectAllSheets();
    }


    @RequestMapping("/getMyScore")
    @ResponseBody
    public List<GradeSheet> getMyScore(String stuNo) {
        return gradeSheetService.selectGradesByStuNo(stuNo);
    }


    @RequestMapping("/getMyCScore")
    @ResponseBody
    public List<GradeSheet> getMyCScore(String name) {
        return gradeSheetService.getMyCScore(name);
    }

    @PostMapping("/conditionQuerySheets")
    @ResponseBody
    public List<GradeSheet> conditionQuerySheets(@RequestBody Map<String, Object> map) {
        Integer stuNo = (Integer) map.get("stuNo");
        Integer cNo = (Integer) map.get("cNo");
        Integer min = (Integer) map.get("minGrade");
        Integer max = (Integer) map.get("maxGrade");
        Double minGrade = min == null ? null : min.doubleValue();
        Double maxGrade = max == null ? null : max.doubleValue();
        return gradeSheetService.conditionQuerySheets(stuNo, cNo, minGrade, maxGrade);
    }

    @PostMapping("/addScore")
    @ResponseBody
    public Integer addScore(@RequestBody GradeSheet gradeSheet) {
        return gradeSheetService.insertScore(gradeSheet);
    }

    @PostMapping("/deleteGrade")
    @ResponseBody
    public Integer addScore(@RequestBody Map<String, String> map) {
        String stuNo = map.get("stuNo");
        String cNo = map.get("cNo");
        return gradeSheetService.deleteGrade(stuNo, cNo);
    }

    @PostMapping("/updateScore")
    @ResponseBody
    public Integer updateScore(@RequestBody Map<String, String> map) {
        String stuNo = map.get("stuNo");
        String cNo = map.get("cNo");
        String grade = map.get("grade");
        Double gradeToDouble = Double.valueOf(grade);
        return gradeSheetService.updateScore(stuNo, cNo, gradeToDouble);
    }
}
