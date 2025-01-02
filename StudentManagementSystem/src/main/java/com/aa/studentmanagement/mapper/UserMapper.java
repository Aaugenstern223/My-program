package com.aa.studentmanagement.mapper;

import com.aa.studentmanagement.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    // 根据用户名和密码查询用户
    User getUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    // 添加用户
    void addUser(@Param("username") String username, @Param("password") String password, @Param("role") String role, @Param("tcrClass") String tcrClass);
}