<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>deptlist</title>
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
                <th><input type="checkbox" id="chooseAll"></th>
                <th>#</th>
                <th>部门</th>
                <th>地址</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${pageInfo.list}" var="dept" varStatus="index">
                <tr>
                    <td><input type="checkbox" class="item" value="${dept.id}"></td>
                    <td>${index.index+1}</td>
                    <td>${dept.dname}</td>
                    <td>${dept.location}</td>
                    <td>
                        <button type="button" class="btn btn-info update_id" value="${dept.id}">修改</button>
                        <button type="button" class="btn btn-danger delete_id" value="${dept.id}">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary" id="addDept">增加</button>
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
                            <a href="${pageContext.request.contextPath}/deptlist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--当前页不能超过分页总数--%>
                    <c:forEach items="${pageInfo.navigatepageNums}"  var="num">
                        <li <c:if test="${pageInfo.pageNum==num}">class="active" </c:if> >

                            <a href="${pageContext.request.contextPath}/deptlist?pageNum=${num}">${num}</a>
                        </li>
                    </c:forEach>


                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!(pageInfo.isLastPage)}">
                        <li>
                            <a href="${pageContext.request.contextPath}/deptlist?pageNum=${pageInfo.nextPage}" aria-label="Next">
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
                alert("请选择要删除的部门");
            }else{
                $(".item").each(function () {
                    var item =$(this);
                    if(item.prop("checked")){
                        var id=item.val();
                        ids[ids.length]=id;
                    }
                    var path = "${pageContext.request.contextPath}/deleteDeptById?id="+ids;
                    location.href=path;
                    // $(".delete_id").val()
                });
            }
        });
        //    单个删除
        $(".delete_id").click(function(){
            var curId =$(this);
            var path = "${pageContext.request.contextPath}/deleteDeptById?id="+curId.val();
            location.href=path;
        });
        //    添加部门
        $("#addDept").click(function () {
            var path = "${pageContext.request.contextPath}/addDept";
            location.href=path;
        });

        //    修改
        $(".update_id").click(function () {
            var curId= $(this).val();
            var path = "${pageContext.request.contextPath}/updateDeptView?id="+curId;
            location.href=path;
        });
    });
</script>
</body>
</html>