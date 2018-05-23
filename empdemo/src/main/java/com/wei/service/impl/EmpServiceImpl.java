package com.wei.service.impl;

import com.wei.entity.Emp;
import com.wei.mapper.EmpMapper;
import com.wei.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService{

    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Emp> listEmp(){
        return empMapper.listEmp();
    }
}
