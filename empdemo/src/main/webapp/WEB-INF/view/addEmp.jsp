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
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/saveEmp" id="addEmpForm" method="post">
            <div class="form-group" id="checkName">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="name" class="form-control" id="name" placeholder="2到4位" name="name">
                </div>
            </div>

            <div class="form-group" id="checkPhone">
                <label for="phone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-6">
                    <input type="phone" class="form-control" id="phone" placeholder="11位手机号" name="phone">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="sex" value="男" > 男
                    </label>
                    <label class="radio-inline">
                    <input type="radio" name="sex" value="女"> 女
                    </label>
                </div>

            </div>
            <div class="form-group" id="checkSalary">
                <label for="salary" class="col-sm-2 control-label">工资</label>
                <div class="col-sm-6">
                    <input type="salary" class="form-control" id="salary" placeholder="小于6位的数字" name="salary">
                </div>
            </div>
            <div class="form-group">
                <label for="dept" class="col-sm-2 control-label">部门</label>
                <div class="col-sm-6">
                    <select class="form-control" id="dept" name="dept_id">
                        <c:forEach items="${dept}" var="dept">
                            <%--value是传给后台的表单处理  后面是网页显示值--%>
                            <option value="${dept.id}">${dept.dname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" id="confirm">确认</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
<script type="text/javascript" src="r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="r/bootstrap/js/bootstrap.min.js"></script>
<script>
    $("#name").blur(function () {
        var regex=/^[\u4e00-\u9fa5]{2,4}$/;
        var cname = regex.test($(this).val());
        if(cname==true){
            $("#checkName").attr("class","form-group has-success");
        }else{
            $("#checkName").attr("class","form-group has-error");
        }
    });
    $("#phone").blur(function () {
        var regex=/^[1][3,5,7,8][0-9]{9}$/;
        var cphone = regex.test($(this).val());
        if(cphone==true){
            $("#checkPhone").attr("class","form-group has-success");
        }else{
            $("#checkPhone").attr("class","form-group has-error");
        }
    });
    $("#salary").blur(function () {
        var regex=/^[1-9][0-9]{0,5}$/;
        var csalary = regex.test($(this).val());
        if(csalary==true){
            $("#checkSalary").attr("class","form-group has-success");
        }else{
            $("#checkSalary").attr("class","form-group has-error");
        }
    });


    <%--提交表单--%>
    $(function () {
       $("#confirm").click(function () {
           //校验
           $("addEmpForm").submit();
       });
    });
</script>
</body>
</html>