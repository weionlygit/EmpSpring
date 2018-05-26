package com.wei.service.impl;

import com.wei.entity.Dept;
import com.wei.mapper.DeptMapper;
import com.wei.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> listDept() {
        return deptMapper.listDept();
    }

    @Override
    public int deleteDeptbyId(int id) {
        return deptMapper.deleteDeptById(id);
    }

    @Override
    public int saveDept(Dept dept) {
        return deptMapper.saveDept(dept);
    }

//    @Override
//    public int deptCount() {
//        return deptMapper.deptCount();
//    }
}
