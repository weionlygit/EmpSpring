package com.wei.mapper;

import com.wei.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {
    List<Dept> listDept();
    int deleteDeptById(int[] id);

    int saveDept(@Param("dept") Dept dept);
    Dept listDeptByDname(String dname);

    Dept listDeptById(int id);

    int updateDept(@Param("dept")Dept dept);

//    int deptCount();

}
