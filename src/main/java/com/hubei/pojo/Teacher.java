package com.hubei.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;


@Data
public class Teacher {
    private String id;
    private String name;
    private String gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String birth;
    private String dept;
    private Long tele;
}
