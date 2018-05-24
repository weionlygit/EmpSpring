package com.wei.service;

import com.wei.entity.Dept;

import java.util.List;

public interface DeptService {
    /**
     * 为添加员工页携带部门信息
     */
    List<Dept> listDept();
}
