<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>updateDept</title>
    <link rel="stylesheet" href="r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/updateDept" id="addDeptForm" method="post">
            <div class="form-group" id="checkID">
                <label for="id" class="col-sm-2 control-label">id</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="id"  name="id" value="${dept.id}" readonly="readonly">
                </div>
            </div>
            <div class="form-group" id="checkName">
                <label for="dname" class="col-sm-2 control-label">部门</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="dname" placeholder="2-8位中文或数字" name="dname" value="${dept.dname}">
                </div>
            </div>

            <div class="form-group" id="checkPhone">
                <label for="location" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="phone" class="form-control" id="location"  name="location" value="${dept.location}">
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" id="confirm">确认修改</button>
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
        var name;

        $("#dname").blur(function () {
            var regex=/^[0-9\u4e00-\u9fa5]{2,8}$/;
            var cname = regex.test($(this).val());
            if(cname==true){
                $("#checkName").attr("class","form-group has-success");
                name=true;
            }else{
                $("#checkName").attr("class","form-group has-error");
                name=false;
            }
        });

        <%--提交表单--%>
        $("#confirm").click(function () {
            if(name==true){
                //本来弄一个disabled属性  符合条件就去掉 没弄好
                $("#addDeptForm").submit();
            }
        });

    });
</script>
</body>
</html>