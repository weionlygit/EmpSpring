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
    public User listUser(String username) {
        return userMapper.listUser(username);
    }
}
