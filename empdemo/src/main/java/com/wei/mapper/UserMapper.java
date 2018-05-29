package com.wei.mapper;

import com.wei.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User listUserByUsername(String username);
    User listUser();
    int saveUser(@Param("user")User user);
    User checkUserName(String username);
}
