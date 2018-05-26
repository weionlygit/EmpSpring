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

    @RequestMapping(value = {"/deleteDeptById"})
    public String deleteDeptById(int id){

        deptService.deleteDeptbyId(id);
        return "deptlist";
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
     * 删除部门
     */

}
