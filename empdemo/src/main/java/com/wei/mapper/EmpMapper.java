package com.wei.mapper;

import com.wei.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    List<Emp> listEmp();
    int deleteEmpById(int[] ids);
    int saveEmp(@Param("emp")Emp emp);
}
