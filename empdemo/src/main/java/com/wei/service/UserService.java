package com.wei.service;

import com.wei.entity.User;

public interface UserService {
    User listUserByUsername(String username);
    User listUser();
    int saveUser(User user);
    User checkUsername(String username);
}
