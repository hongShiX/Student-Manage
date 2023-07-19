package com.hubei.dao;

import com.hubei.pojo.Clazz;
import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;

public interface ClazzMapper {
    Clazz selectByName(String name);

    List<Clazz> selectAllClazz();

    List<Clazz> conditionQueryClazz(@Param("name") String name, @Param("major") String major, @Param("start")  @DateTimeFormat(pattern = "yyyy-mm-dd") String start);

    Integer addClass(Clazz clazz);

    Integer deleteClass(@Param("name") String name);

    Integer updateClass(Clazz clazz);

}
