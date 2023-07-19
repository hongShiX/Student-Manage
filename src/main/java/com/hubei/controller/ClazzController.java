package com.hubei.controller;

import com.hubei.pojo.Clazz;
import com.hubei.service.ClazzService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class ClazzController {
    @Resource
    private ClazzService clazzService;

    @GetMapping("/getClassInfo")
    @ResponseBody
    public List<Clazz> selectClazzInfo() {
        return clazzService.selectAllClazz();
    }

    @PostMapping ("/conditionQueryClazz")
    @ResponseBody
    public List<Clazz> conditionQueryClazz(@RequestBody Clazz clazz) {
        return clazzService.conditionQueryClazz(clazz.getName(), clazz.getMajor(), clazz.getStart());
    }

    @PostMapping("/addClass")
    @ResponseBody
    public Integer addClass(@RequestBody Clazz clazz) {
        return clazzService.addClass(clazz);
    }

    @PostMapping("/deleteClass")
    @ResponseBody
    public Integer deleteClass(@RequestBody Map<String, Object> map) {
        String name = (String)map.get("name");
        return clazzService.deleteClass(name);
    }

    @PostMapping("/updateClass")
    @ResponseBody
    public Integer updateClass(@RequestBody Clazz clazz) {
        return clazzService.updateClass(clazz);
    }


    @GetMapping("/getMyClass")
    @ResponseBody
    public Clazz getMyClass(String name) {
        return clazzService.getMyClass(name);
    }
}
