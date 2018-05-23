package com.wei.service;

import com.wei.entity.Emp;
import org.springframework.stereotype.Service;

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
}
