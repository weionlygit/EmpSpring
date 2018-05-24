package com.wei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wei.entity.Dept;
import com.wei.entity.Emp;
import com.wei.mapper.EmpMapper;
import com.wei.service.DeptService;
import com.wei.service.EmpService;
import com.wei.service.impl.EmpServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
//@RequestMapping(value = {"/emp"})这个是干啥的
public class EmpController {

    @Autowired
    private EmpService empService;

    /**
     * 显示员工数据
     * @param param
     * @param pageNum
     * @return
     */
//    处理请求地址映射的注解
    @RequestMapping(value = {"/emplist"})
    public String empList(ModelMap param, @RequestParam(name = "pageNum" ,defaultValue = "1") int pageNum){
        PageHelper.startPage(pageNum,10);
        List<Emp> empList = empService.listEmp();

        PageInfo<Emp> pageInfo =new PageInfo<>(empList,10);
        param.put("pageInfo",pageInfo);

        return "emplist";
    }

    /**
     * 删除员工
     * @param id
     * @return
     */
    @RequestMapping(value = {"/deleteEmpById"})
    public String deleteEmpById(int[] id){
//        传过来的数组 spring自己会截开（把逗号去掉）
//只能叫id  不是一个别名，闹不清
        empService.deleteEmpById(id);

        return "redirect:/emplist";
    }

    /**
     * 添加员工
     * @return
     */
    @Autowired
    private DeptService deptService;

    @RequestMapping(value = {"/addEmp"})
    public String addEmp(ModelMap param){
        List<Dept> listDept= deptService.listDept();
        param.put("dept",listDept);
        return "addEmp";
    }

    /**
     * 添加的员工传到后台
     */
    @RequestMapping(value = {"/saveEmp"})
    public String saveEmp(Emp emp){

        empService.saveEmp(emp);
//        不能转发-500 ，转发和重定向 区别
        return "redirect:/emplist";
    }
}
