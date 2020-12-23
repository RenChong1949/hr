<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
<title>人力资源档案登记查询</title>
<link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet" type="text/css" />
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
<body
	style="background-color: #ecf0f5; font-family: 微软雅黑; color: #475059; min-width: 1000px; overflow: auto">
	<div class="notice_main">
		<div class="notice_check">
			<div class="btn-group l_left" style="margin-right: 4px">
				<button type="button" class="btn btn-default change"
					style="height: 30px; line-height: 30px; padding: 0 12px !important; font-size: 12px">选择条件</button>
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					style="height: 30px; line-height: 30px">
					<span class="caret"></span> <span class="sr-only"></span>
				</button>
				<ul class="dropdown-menu">
					<li>角色名称</li>
					<li>角色描述</li>
				</ul>
			</div>
			<div class="l_left">
				<input type="text" class="find_input">
			</div>
			<button class="check_btn">查询</button>
<%--			<div class="notice_nav r_right" style="margin-bottom: 15px">--%>

<%--				<a class="btn btn-default"><span--%>
<%--					class="glyphicon glyphicon-remove"></span>删除</a> <a--%>
<%--					class="btn btn-primary" href="人力资源档案登记复核修改.html">复核</a>--%>
<%--			</div>--%>

			<div class="clear"></div>
		</div>
		<table id="table"
			class="table table-bordered table-condensed table-hover"
			style="margin: 0 auto">
			<tr>
				<th>档案编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>I级机构</th>
				<th>II级机构</th>
				<th>III级机构</th>
				<th>职称</th>
				<th colspan="3">复核</th>
			</tr>
			<c:forEach items="${pageinfo.list}" var="fth">
				<tr>
					<td>${fth.humanId }</td>
					<td>${fth.humanName }</td>
					<td>${fth.humanSex }</td>
					<td>${fth.firstKindName }</td>
					<td>${fth.secondKindName }</td>
					<td>${fth.thirdKindName }</td>
					<td>${fth.humanProDesignation }</td>
					<td><a href="${pageContext.request.contextPath}/HumanFile/selectByPrimaryKey?humanid=${fth.humanId}">复核</a></td>
					<td><a href="${pageContext.request.contextPath}/HumanFile/selectByPrimaryKey_update?humanid=${fth.humanId}">修改</a></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<div class="fixed-table-pagination" style="display: block;">
		<div class="pull-left pagination-detail">
			<span class="pagination-info">显示第 ${pageinfo.startRow } 到第
				${pageinfo.endRow }条记录，总共 ${pageinfo.total } 条记录</span><span
				class="page-list">每页显示 <span class="btn-group dropup"><button
						type="button" class="btn btn-default  dropdown-toggle"
						data-toggle="dropdown">
						<span class="page-size">${pageinfo.pageSize }</span> <span
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
				
				
					<c:if test="${pageinfo.hasPreviousPage }">
						<li class="page-pre" >
							<a href="?page=${pageinfo.pageNum-1}" ><</a>
						</li>
					</c:if>
					<c:if test="${!pageinfo.hasPreviousPage }">
						<li class="page-pre disabled" >
							<a href="?page=${pageinfo.pageNum}"><</a>
						</li>
					</c:if>
				
				<c:forEach items="${pageinfo.navigatepageNums }" var="vn">
					<c:if test="${vn==pageinfo.pageNum }">
						<li class="page-number active"><a href="?page=${vn}">${vn }</a>
						</li>
					</c:if>
					<c:if test="${vn!=pageinfo.pageNum }">
						<li class="page-number"><a href="?page=${vn}">${vn }</a>
						</li>
					</c:if>
				</c:forEach>

				<c:if test="${pageinfo.hasNextPage }">
						<li class="page-pre" >
							<a href="?page=${pageinfo.pageNum+1}" >></a>
						</li>
					</c:if>
					<c:if test="${!pageinfo.hasNextPage }">
						<li class="page-pre disabled" >
							<a href="?page=${pageinfo.pageNum}">></a>
						</li>
					</c:if>
			</ul>
		</div>
	</div>

</body>
</html>
