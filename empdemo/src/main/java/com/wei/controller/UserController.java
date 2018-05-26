package com.wei.controller;

import com.wei.entity.User;
import com.wei.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/login"})
    public void login(String username, HttpServletResponse res) throws IOException {
        User user= userService.listUser(username);
        PrintWriter out= res.getWriter();
        if(user==null){
            out.print("false");
        }else{
            out.print("true");
        }
    }
}
