package com.hubei.pojo;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    public static final Integer USER_TEACHER = 0;
    public static final Integer USER_STUDENT = 1;
    public static final Integer USER_MANAGER = 2;
    private String username;
    private String password;
    private Integer userType;
}
