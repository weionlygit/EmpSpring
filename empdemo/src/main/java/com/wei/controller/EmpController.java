package com.wei.controller;

import com.wei.service.EmpService;
import com.wei.service.impl.EmpServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping(value = {"/emp"})这个是干啥的
public class EmpController {

    @Autowired
    private EmpService empService;

//    处理请求地址映射的注解
    @RequestMapping(value = {"/emplist"})
    public String empList(ModelMap param){
        param.put("emplist",empService.listEmp());
        return "emplist";
    }
}
