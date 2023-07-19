package com.hubei.controller;

import com.hubei.pojo.Curriculum;
import com.hubei.service.CurriculumService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class CurriculumController {
    @Resource
    private CurriculumService curriculumService;

    @GetMapping("/getMyCurriculums")
    @ResponseBody
    public List<Curriculum> getCurriculumByClass() {
        return curriculumService.selectAllCurriculums();
    }

    @PostMapping("/conditionQueryCurriculum")
    @ResponseBody
    public List<Curriculum> conditionQueryCurriculum(@RequestBody Map<String, Object> map) {
        Integer cNo = (Integer) map.get("cNo");
        String cName = (String) map.get("cName");
        String teacher = (String) map.get("teacher");
        String teachTime = (String) map.get("teachTime");

        return curriculumService.conditionQueryCurriculum(cNo, cName, teacher, teachTime);
    }

    @GetMapping("/selectCourseByTeacher")
    @ResponseBody
    public List<Curriculum> getCourseByTeacher(String name) {
        return curriculumService.getCurriculumsByTeacher(name);
    }


    @GetMapping("/selectCurriByClass")
    @ResponseBody
    public List<Curriculum> selectCurriByClass(String cNo) {
        return curriculumService.selectByCno(cNo);
    }

    @GetMapping("/selectCurriByClassName")
    @ResponseBody
    public List<Curriculum> selectCurriByClassName(String stuClass) {
        return curriculumService.selectCurriByClassName(stuClass);
    }

    @PostMapping("/addCu")
    @ResponseBody
    public Integer addCu(@RequestBody Curriculum curriculum) {
        return curriculumService.addCu(curriculum);
    }


    @PostMapping("/deleteCu")
    @ResponseBody
    public Integer deleteCu(@RequestBody Map<String, String> map) {
        String id = map.get("id");
        return curriculumService.deleteCu(id);
    }

    @PostMapping("/updateCu")
    @ResponseBody
    public Integer updateCu(@RequestBody Curriculum curriculum) {
        return curriculumService.updateCu(curriculum);
    }
}
