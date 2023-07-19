package com.hubei.service;

import com.hubei.pojo.Clazz;
import java.util.List;

public interface ClazzService {
    Clazz selectByName(String name);

    List<Clazz> selectAllClazz();

    List<Clazz> conditionQueryClazz(String name, String major, String start);

    Integer addClass(Clazz clazz);

    Integer deleteClass(String name);

    Integer updateClass(Clazz clazz);

    Clazz getMyClass(String name);
}