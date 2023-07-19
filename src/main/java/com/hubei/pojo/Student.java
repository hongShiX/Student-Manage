package com.hubei.pojo;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;


@Data
public class Student {
    private String stuNo;
    private String stuName;
    private String stuGender;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private String stuBirth;
    private String stuMajor;
    private String stuClass;
    private String stuArea;
    private Integer stuTele;
    private String stuPs;
}
