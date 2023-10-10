<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.min.js" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-select.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%@include file="/main_style_user.jsp" %>
	<div class="container">
		<div class="tab-content" >
		  	<div role="tabpanel" class="tab-pane active" id="home">
			  	<div align="center" style="border: 1px solid ;  width:800px;; margin-left: 200px;margin-top: 50px;">
			<!-- 系统用户管理 -->	
			<div class="panel panel-default" style="margin-top: 50px; width:1000px; ">
					<div  align="left" class="panel-body">
					        <div id="toolbar" class="btn-group">
					            <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModalSystem">
					                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					            </button>
					        </div>
					  	<table  id="table_server_system">
					  </table>
					  </div>
					  </div>				
				</div>
			</div>
		</div>
	</div>
</html>