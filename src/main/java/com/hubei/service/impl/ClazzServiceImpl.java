package com.hubei.service.impl;

import com.hubei.dao.ClazzMapper;
import com.hubei.pojo.Clazz;
import com.hubei.service.ClazzService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {
    @Resource
    private ClazzMapper clazzMapper;
    @Override
    public Clazz selectByName(String name) {
        return clazzMapper.selectByName(name);
    }

    @Override
    public List<Clazz> selectAllClazz() {
        return clazzMapper.selectAllClazz();
    }

    @Override
    public List<Clazz> conditionQueryClazz(String name, String major, String start) {
        return clazzMapper.conditionQueryClazz(name, major, start);
    }

    @Override
    public Integer addClass(Clazz clazz) {
        return clazzMapper.addClass(clazz);
    }

    @Override
    public Integer deleteClass(String name) {
        return clazzMapper.deleteClass(name);
    }

    @Override
    public Integer updateClass(Clazz clazz) {
        return clazzMapper.updateClass(clazz);
    }

    @Override
    public Clazz getMyClass(String name) {
        return clazzMapper.selectByName(name);
    }
}
