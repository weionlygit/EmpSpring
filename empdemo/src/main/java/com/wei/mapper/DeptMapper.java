package com.wei.mapper;

import com.wei.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {
    List<Dept> listDept();
    int deleteDeptById(int id);
    int saveDept(@Param("dept") Dept dept);

//    int deptCount();

}
