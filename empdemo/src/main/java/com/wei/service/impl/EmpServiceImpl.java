package com.wei.service.impl;

import com.wei.entity.Emp;
import com.wei.mapper.EmpMapper;
import com.wei.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService{

    /**
     * 查询
     */
    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Emp> listEmp(){
        return empMapper.listEmp();
    }
    /**
     *删除员工
     */
    @Override
    public int deleteEmpById(int[] ids) {
        return empMapper.deleteEmpById(ids);
    }
    /**
     * 添加员工 存入数据库
     */
    @Override
    public int saveEmp(Emp emp) {
        return empMapper.saveEmp(emp);
    }

    /**
     * 修改员工
     * @param emp
     * @return
     */
    @Override
    public int updateEmp(Emp emp) {
        return empMapper.updateEmp(emp);
    }

    @Override
    public Emp listEmpById(int id) {
        return empMapper.listEmpById(id);
    }


}
