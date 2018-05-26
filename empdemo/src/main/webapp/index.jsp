<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>addEmp</title>
    <link rel="stylesheet" href="r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head">
        <h1 style="margin:50px auto;display: block;width: 400px">欢迎登陆员工管理系统</h1>
    </div>
    <div class="row body">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/emplist" id="loginForm" method="post">
            <div class="form-group" id="checkName">
                <label for="username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="username" name="username">
                </div>
            </div>
            <div class="form-group" id="checkPass">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="password"   name="password">
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" id="confirm">登录</button>
                    <a href="#">注册</a>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
<script type="text/javascript" src="r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="r/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        // var username = $("#username").val();
        $("#confirm").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/login?username="+$("#username").val(),
                type:"post",
                success:function(data){
                    if(data.trim()=="true"){
                        $("#checkName").attr("class","form-group has-success");
                        $("#checkPass").attr("class","form-group has-success");
                        $("#loginForm").submit();
                    }else{
                        $("#checkName").attr("class","form-group has-error");
                        $("#checkPass").attr("class","form-group has-error");
                        alert("用户名或密码错误");
                    }
                }
            });
        });

    });
</script>
</body>
</html>