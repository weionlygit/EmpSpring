package com.wei.mapper;

import com.wei.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    List<Emp> listEmp();
    int deleteEmpById(int[] ids);
    int saveEmp(@Param("emp")Emp emp);
//    修改
    int updateEmp(@Param("emp")Emp emp);
//    把要修改的数据带过去
    Emp listEmpById(int id);
}
