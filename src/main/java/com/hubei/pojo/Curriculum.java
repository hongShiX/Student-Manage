package com.hubei.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 课程表
 */
@Data
public class Curriculum {
    private Integer id;
    private Integer cNo;
    private String className;
    private String teacher;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String teachTime;
    private String teachPlace;
}
