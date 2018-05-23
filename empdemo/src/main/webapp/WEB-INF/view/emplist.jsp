<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>emplist</title>
    <link rel="stylesheet" href="r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="r/css/style.css">
    <%--${pageContext.request.contextPath}--%>
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>#</th>
                <th>姓名</th>
                <th>手机</th>
                <th>性别</th>
                <th>工资</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${emplist}" var="emp" varStatus="index">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${index.index+1}</td>
                    <td>${emp.name}</td>
                    <td>${emp.phone}</td>
                    <td>${emp.sex}</td>
                    <td>${emp.salary}</td>
                    <td>${emp.dept.dname}</td>
                    <td>
                        <button type="button" class="btn btn-info">修改</button>
                        <button type="button" class="btn btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary">增加</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="r/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>