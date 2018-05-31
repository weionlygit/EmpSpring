package com.wei.controller;

import com.wei.entity.User;
import com.wei.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiFileChooserUI;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@Controller
@RequestMapping({"/user"})
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录页面
     * @return
     */
    @RequestMapping({"/loginView"})
    public String loginView(){
        return "loginView";
    }
    /**
     * 登录
     * @param username
     * @param res
     * @param req
     * @throws IOException
     */
    @RequestMapping(value = {"/login"})
    public void login(String username, String password, HttpServletResponse res, HttpServletRequest req) throws IOException {
        System.out.println(username);
        System.out.println(password);
        User user= userService.listUserByUsername(username);

        PrintWriter out= res.getWriter();
//登录后放在session中 拦截器去判断
        HttpSession httpSession =req.getSession();
//        一分钟
        httpSession.setMaxInactiveInterval(60);
        httpSession.setAttribute("user",user);
//免登陆，存cookie
        Cookie cookie= new Cookie("cookie",user.getUsername());
        cookie.setMaxAge(30);//30分钟
        res.addCookie(cookie);

        if(!(user==null)&&user.getPassword().equals(password)){
            out.print("true");
        }else{
            out.print("false");
        }
    }
    /**
     * cookie验证 有则转发emplist 无则转发loginView
     */
//    @RequestMapping({"/checkCookie"})
//    public String checkCookie(HttpServletResponse res, HttpServletRequest req){
////        查数据库用户
//        User user= userService.listUser();
////        查所有cookie
//        Cookie[] cookies= req.getCookies();
//        if(cookies==null){
//            return "redirect:loginView";
//        }else{
//            for (Cookie cookie : cookies) {
//                if(cookie..equals(user.getUsername())){
//                    return "redirect:emplist";
//                }
//                    return "redirect:loginView";
//            }
//        }
//    }

    /**
     * 注册
     * @return
     */
    @RequestMapping(value = {"/register"})
    public String register(){
        return "register";
    }
//    ajax校验
    @RequestMapping(value = {"/checkRegister"})
    public void checkRegister(String username,HttpServletResponse res) throws IOException {
        System.out.println("username="+username);
        PrintWriter out = res.getWriter();
        User user= userService.checkUsername(username);
        System.out.println(user);
        if(user==null){
            out.print("true");
        }else{
            out.print("false");
        }
    }
//    提交后存图片地址
    @RequestMapping(value = {"/confirmRegister"})
    public String confirmRegister(String username,String password,MultipartFile headimg,HttpServletRequest res) throws IOException {
//        获取服务器路径
        String uploadPath= res.getServletContext().getRealPath("/upload/");
//        判断父路径是否有
        File uploadFile =new File(uploadPath);
//        如果没有就创建一个
        if(!uploadFile.exists()){
            uploadFile.mkdir();
        }
//        抓取上传文件名
        String filename =headimg.getOriginalFilename();

        String filepath=uploadPath+ UUID.randomUUID().toString()+filename.substring(filename.indexOf("."));

        File file = new File(filepath);
        headimg.transferTo(file);
//        把路径存到数据库,全路径是d盘开始的 不能
        String imgPath = filepath.substring(filepath.lastIndexOf("\\upload"));
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPath(imgPath);
        System.out.println(user);
        userService.saveUser(user);
        return "redirect:loginView";
    }
}
