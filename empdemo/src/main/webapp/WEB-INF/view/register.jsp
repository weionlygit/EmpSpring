<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>addEmp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head">
        <h1 style="margin:28px auto;display: block;width: 80px">注册</h1>
    </div>
    <div class="row body">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/user/confirmRegister" id="addDeptForm" method="post" enctype="multipart/form-data">

            <div class="form-group" id="checkUserName">
                <label for="username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="username"  laceholder="2-8位中文" name="username">
                </div>
            </div>

            <div class="form-group" id="checkPassword">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="phone" class="form-control" id="password"  name="password">
                </div>
            </div>

            <div class="form-group" >
                <label for="headimg" class="col-sm-2 control-label">上传头像</label>
                <div class="col-sm-6">
                    <input type="file" class="form-control" id="headimg" name="headimg">
                    <img src="" alt="" id="preview" class="img-thumbnail" width="80px" height="85px">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" id="confirm">确认</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        var name;
        var headimg;
        $("#username").blur(function () {
            var username=$(this).val();
            var regex=/^[0-9\u4e00-\u9fa5]{2,6}$/;
            var cname = regex.test($(this).val());
            alert(username);
            alert(cname);
            if(cname==true){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkRegister?username="+username,
                    type:"get",
                    // data:"checkUsername"+username,
                    success:function(data){
                        if(data.trim()=="true"){
                            $("#checkUserName").attr("class","form-group has-success");
                            name=true;
                        }else{
                            $("#checkUserName").attr("class","form-group has-error");
                            alert("已存在");
                            name=false;
                        }
                    }
                });
            }else{
                $("#checkUserName").attr("class","form-group has-error");
                name=false;
            }
        });
        //头像上传
        $("#headimg").change(function(){
            var path =$(this).val();
            var suffix =path.substring(path.indexOf("."));
            if(suffix===".jpg"||suffix===".png"){
                //图片预览
                var img =document.getElementById("headimg").files[0];
                var reader = new FileReader();
                reader.readAsDataURL(img);
                reader.onload=function(){
                    $("#preview").attr("src",this.result);
                }
                headimg=true;
            }else{
                headimg=false;
            }
        });


        <%--提交表单--%>
        $("#confirm").click(function () {
            if(name==true&&headimg==true){
                //本来弄一个disabled属性  符合条件就去掉 没弄好
                $("#addDeptForm").submit();
            }
        });

    });
</script>
</body>
</html>