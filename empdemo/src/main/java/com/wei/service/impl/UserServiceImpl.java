package com.wei.service.impl;

import com.wei.entity.User;
import com.wei.mapper.UserMapper;
import com.wei.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public User listUserByUsername(String username) {
        return userMapper.listUserByUsername(username);
    }

    @Override
    public User listUser() {
        return userMapper.listUser();
    }

    @Override
    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }

    @Override
    public User checkUsername(String username) {
        return userMapper.checkUserName(username);
    }

}
