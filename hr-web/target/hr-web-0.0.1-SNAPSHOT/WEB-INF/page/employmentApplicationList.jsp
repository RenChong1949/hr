<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
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

        <!--<div class="notice_nav r_right">
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>删除</a>
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-pencil"></span>编辑</a>
            <a class="btn btn-default" onclick="warrant()"><span class="glyphicon glyphicon-tag"></span>角色授权</a>
        </div>-->
        <div class="clear"></div>
    </div>
    <table id="table" class="table table-condensed" style="margin: 0 auto">
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>职位类别</th>
            <th>职位名称</th>
            <th>毕业校园</th>
            <th>学历专业</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="i">
            <tr>
                <td>${i.humanName}</td>
                <td>${i.humanSex}</td>
                <td>${i.humanAge}</td>
                <td>${i.majorKindName}</td>
                <td>${i.majorName}</td>
                <td>${i.humanCollege}</td>
                <td>${i.humanEducatedMajor}</td>
                <td><a href="${pageContext.request.contextPath}/engageInterview/employmentApplication?einId=${i.einId}">申请</a></td>
            </tr>
        </c:forEach>

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
<script src="${pageContext.request.contextPath}/static/js/bstable/js/bootstrap.min.js"></script>
</body>

</html>