<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业考勤管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function result(){
	//document.getElementById("deptCode").value="";
	document.getElementById("loginId").value="";
	document.getElementById("passWord").value="";
}
</script>
</head>
<body style="border-style:none; background-image: url('${pageContext.request.contextPath}/images/login.jpg');background-repeat: no-repeat;  background-attachment: fixed; background-size:100% 100%;  width:100%;height: 550px; margin-top: -30px;overflow: hidden; margin-left: 10px; "scroll="no">
	<div class="container-fluid">
		<form id="myform"  style="" action="${pageContext.request.contextPath}/login/user.do" method="get">
	
			<div align="center" class="row" style="font-size: 50px;margin-top: 50px;">
							企业考勤管理系统
		   </div>
		   <div align="center" class="row" style="margin-top: 70px; margin-right: 90px;">
			   <table width="60%" style="font-size: 22px;" >
				<!--<tr>
						<td style="text-align: right;">
							<label for="deptCode" class="control-label">所属公司:</label>
						</td>
						<td> 
							<div class="col-sm-11">
						     <input type="text" class="form-control" id="deptCode"  name="deptCode" placeholder="所属公司"  required >
							</div>
						</td>
					</tr>  -->	
					<tr>
						<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<label for="inputEmail3" class="control-label">用户名:</label>
						 </td>
						<td> 
							<div class="col-sm-11">
							     <input type="text" maxlength="15" class="form-control" id="loginId" name="loginId" placeholder="用户名"  required>
							</div>
						</td>
					</tr>
					<tr>
						<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<label for="inputEmail3" maxlength="15" class="control-label">密码:</label>
						 </td>
						<td> 
							<div class="col-sm-11">
							     <input type="password" class="form-control" id="passWord" name="passWord" placeholder="密码"  required>
							     			   	<span style="font-size: 18px;color: red;">${loginErro}</span>
							</div>
						</td>
					</tr>
			 	</table>
			 </div>
 	<div align="center"  class="row" style="margin-top: 30px;">
			 <button type="submit" class="btn btn-default">登陆</button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default" onclick="result()">重置</button>
	</div>
		</form>
	</div>
</body>
</html>