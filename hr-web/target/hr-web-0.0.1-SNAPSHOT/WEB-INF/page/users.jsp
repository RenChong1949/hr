<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"/>
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet" type="text/css"/>

    <style>
        .notice_nav a:nth-child(3) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0
        }

        .notice_nav a:nth-child(4) {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px
        }
    </style>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <div class="notice_check">

        <div class="btn-group r_right">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/useradd">添加用户</a>
        </div>
        <div class="clear"></div>
    </div>
    <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
        <thead>
        <tr>
            <th>
                用户编号
            </th>
            <th>
                用户名称
            </th>
            <th>
                真实姓名
            </th>
            <th>
                用户密码
            </th>
            <th>
                用户身份
            </th>
            <th>
                操作
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="u">
            <tr>
                <td>${u.uId}</td>
                <td>${u.uName}</td>
                <td>${u.trueName}</td>
                <td>${u.uPassword}</td>
                <td>${u.uRole!=null?u.uRole.roleName:"角色已经被删除"}</td>
                <td><a href="${pageContext.request.contextPath}/user/usermodify?uid=${u.uId}">修改</a><a href="javascript:del(${u.uId})">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<div class="fixed-table-pagination" style="display: block;">
    <div class="pull-left pagination-detail">
			<span class="pagination-info">显示第 ${pageInfo.startRow } 到第
				${pageInfo.endRow }条记录，总共 ${pageInfo.total } 条记录</span><span
            class="page-list">每页显示 <span class="btn-group dropup"><button
            type="button" class="btn btn-default  dropdown-toggle"
            data-toggle="dropdown">
						<span class="page-size">${pageInfo.pageSize }</span> <span
            class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li class="active"><a href="javascript:void(0)">10</a></li>
						<li><a href="javascript:void(0)">25</a></li>
					</ul> </span> 条记录
			</span>
    </div>
    <div class="pull-right pagination">
        <ul class="pagination">


            <c:if test="${pageInfo.hasPreviousPage }">
                <li class="page-pre">
                    <a href="?page=${pageInfo.pageNum-1}"><</a>
                </li>
            </c:if>
            <c:if test="${!pageInfo.hasPreviousPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageInfo.pageNum}"><</a>
                </li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums }" var="vn">
                <c:if test="${vn==pageInfo.pageNum }">
                    <li class="page-number active"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
                <c:if test="${vn!=pageInfo.pageNum }">
                    <li class="page-number"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.hasNextPage }">
                <li class="page-pre">
                    <a href="?page=${pageInfo.pageNum+1}">></a>
                </li>
            </c:if>
            <c:if test="${!pageInfo.hasNextPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageInfo.pageNum}">></a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script>

    function del(id) {
        layer.confirm('确定要删除这个用户吗?', {icon: 3, title: '提示'}, function (index) {

            var i;
            $.ajax({
                url: "${pageContext.request.contextPath}/user/delUser",
                data: {"uid": id},
                type: "get",
                beforeSend: function () {
                    i = layer.msg('请稍后...', {
                        icon: 16,
                        shade: [0.5, '#f5f5f5'],
                        scrollbar: false,
                        offset: 'auto',
                        time: 10000
                    });
                },
                success: function (data) {
                    layer.close(i)
                    if (data.code == 200) {
                        layer.msg(data.message, {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                window.location.href = "${pageContext.request.contextPath}/user/users";
                            }
                        )
                    } else {
                        layer.msg(data.message, {
                                icon: 2,
                                time: 3000 //2秒关闭（如果不配置，默认是3秒）
                            }
                        )
                    }
                }
            })
            layer.close(index);
        });
    }


</script>
</body>

</html>