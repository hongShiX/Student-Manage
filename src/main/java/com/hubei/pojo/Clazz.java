package com.hubei.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Clazz {
   private String name;
   private String major;
   private Integer number;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private String start;
    private String counsellor;
}
