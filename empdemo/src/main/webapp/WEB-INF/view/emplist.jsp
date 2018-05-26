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
    <div class="row head">
        <a href="deptlist"
           style="font-family:verdana;font-size:150%;color:green;display: inline-block;margin:30px;">部门信息</a>
    </div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" id="chooseAll"></th>
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

            <c:forEach items="${pageInfo.list}" var="emp" varStatus="index">
                <tr>
                    <td><input type="checkbox" class="item" value="${emp.id}"></td>
                    <td>${index.index+1}</td>
                    <td>${emp.name}</td>
                    <td>${emp.phone}</td>
                    <td>${emp.sex}</td>
                    <td>${emp.salary}</td>
                    <td>${emp.dept.dname}</td>
                    <td>
                        <button type="button" class="btn btn-info update_id" value="${emp.id}">修改</button>
                        <button type="button" class="btn btn-danger delete_id" value="${emp.id}">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary" id="addEmp">增加</button>
            <button type="button" class="btn btn-danger" id="deleteAll">删除</button>
        </div>
        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!(pageInfo.isFirstPage)}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emplist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--当前页不能超过分页总数--%>
                    <c:if test="${pageInfo.pages-pageInfo.pageNum>4}" >
                        <%--因为index记录的不是当前的pageNum--%>
                        <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="num" varStatus="index">
                            <c:if test="${index.index==pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index==pageInfo.pageNum)}">
                                <li ><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!(pageInfo.pages-pageInfo.pageNum>4)}" >
                        <%--因为index记录的不是当前的pageNum--%>
                        <c:forEach begin="${pageInfo.pages-4}" end="${pageInfo.pages}" var="num" varStatus="index">
                            <c:if test="${index.index==pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index==pageInfo.pageNum)}">
                                <li ><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>


                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!(pageInfo.isLastPage)}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emplist?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="r/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        //全选与全不选
        $("#chooseAll").click(function () {
            if($("#chooseAll").prop("checked")==true){
                $(".item").prop("checked",true);
            }else{
                $(".item").prop("checked",false);
            }
        });
        //全部删除
        $("#deleteAll").click(function(){
            var ids=[];

            if($(":checked").length==0){
                alert("请选择要删除的员工");
            }else{

                $(".item").each(function () {
                    var item =$(this);
                    if(item.prop("checked")){
                        var id=item.val();
                        ids[ids.length]=id;
                    }
                    var path = "${pageContext.request.contextPath}/deleteEmpById?id="+ids;
                    location.href=path;
                    // $(".delete_id").val()
                });
            }
        });
    //    单个删除
        $(".delete_id").click(function(){
            var curId =$(this);
            var path = "${pageContext.request.contextPath}/deleteEmpById?id="+curId.val();
            location.href=path;
        });
    //    添加员工
        $("#addEmp").click(function () {
            var path = "${pageContext.request.contextPath}/addEmp";
            location.href=path;
        });

    //    修改
        $(".update_id").click(function () {
            var curId= $(this).val();
            var path = "${pageContext.request.contextPath}/updateEmpView?id="+curId;
            location.href=path;
        });
    });
</script>
</body>
</html>