package com.wei.controller;

import com.wei.entity.Dept;
import com.wei.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeptController {

    @Autowired
    public DeptService deptService;

    /**
     * 删除部门
     */
    @RequestMapping(value = {"/deleteDeptById"})
    public String deleteDeptById(int[] id){
        deptService.deleteDeptbyId(id);
        return "redirect:deptlist";
    }

    /**
     * 添加部门
     * @param param
     * @return
     */
    @RequestMapping(value = {"/addDept"})
    public String addDept(ModelMap param){

        return "addDept";
    }
    @RequestMapping(value = {"/saveDept"})
    public String saveDept(Dept dept){
        deptService.saveDept(dept);
        return "redirect:deptlist";
    }
/**
 * 修改部门
 */
    @RequestMapping(value = {"/updateDeptView"})
    public String updateDeptView(ModelMap param,int id){
        Dept dept=deptService.listDeptById(id);
        param.put("dept",dept);
//        转发是转到页面，但重定向会到controller
        return "updateDept";
    }
    @RequestMapping(value = {"/updateDept"})
    public String updateDept(Dept dept){

        deptService.updateDept(dept);
        return "redirect:deptlist";

    }
}
