package com.wei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wei.entity.Emp;
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

//    处理请求地址映射的注解
    @RequestMapping(value = {"/emplist"})
    public String empList(ModelMap param, @RequestParam(name = "pageNum" ,defaultValue = "1") int pageNum){
        PageHelper.startPage(pageNum,10);
        List<Emp> empList = empService.listEmp();

        PageInfo<Emp> pageInfo =new PageInfo<>(empList,10);
        param.put("pageInfo",pageInfo);

        return "emplist";
    }
}
