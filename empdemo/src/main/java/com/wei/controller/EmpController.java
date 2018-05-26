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
//员工部门
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
//    应该是name phone sex 等
    public String saveEmp(Emp emp){

        empService.saveEmp(emp);
//        不能转发-500 ，转发和重定向 区别
        return "redirect:/emplist";
    }

    /**
     * 修改员工,显示原来数据
     */
    @RequestMapping(value = {"/updateEmpView"})
    public String updateEmpView(ModelMap param, int id){
//        前台的emp是从这里那到的
        Emp emp = empService.listEmpById(id);
        List<Dept> listDept= deptService.listDept();
        param.put("emp",emp);
        param.put("dept",listDept);
        return "updateEmp";
    }
//    拿到修改的数据，修改数据库
    @RequestMapping(value = {"/updateEmp"})
    public String updateEmp(Emp emp){
//        这里的emp是从前台拿到的
        System.out.println(emp.getName());
        System.out.println(emp.getPhone());
        System.out.println(emp.getId());
        empService.updateEmp(emp);
        return "redirect:/emplist";
    }
    /**
     * 部门
     */
    @RequestMapping(value = {"/deptlist"})
    public String deptlist(ModelMap param, @RequestParam(name = "pageNum" ,defaultValue = "1") int pageNum){
        PageHelper.startPage(pageNum,5);
        List<Dept> deptlist= deptService.listDept();

        PageInfo<Dept> pageInfo =new PageInfo<>(deptlist,4);
        param.put("pageInfo",pageInfo);

        return "deptlist";
    }
}
