package com.wei.service;

import com.wei.entity.Emp;

import java.util.List;

public interface EmpService {

    /**
     * 查询员工列表
     * @return
     */
    List<Emp> listEmp();
    /**
     * 删除员工
     */
    int deleteEmpById(int[] ids);
    /**
     * 添加员工 存入数据库
     */
    int saveEmp(Emp emp);
    /**
     * 修改员工
     */
    int updateEmp(Emp emp);

    Emp listEmpById(int id);
}
