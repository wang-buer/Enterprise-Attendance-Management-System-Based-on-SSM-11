<%@ page language="java" contentType="text/html; pageEncoding=utf-8"
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-select.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
function insertComs(){
	parent.layer.open({
		type: 2,
        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 添加考勤专员</h4>",
        area: ['430px', '400px'],
        maxmin: false,
        skin: 'demo-class',
        closeBtn: 1,
		  content: '${pageContext.request.contextPath}/conminsert.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		}); 
}
function delCom(){
	
	parent.layer.open({
		type: 2,
        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 删除考勤专员</h4>",
        area: ['430px', '350px'],
        maxmin: false,
        skin: 'demo-class',
        closeBtn: 1,
		  content: '${pageContext.request.contextPath}/conmDel.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		}); 
}
</script>
</head>
<body>
<div class="container">
	<div class="tab-content"  >
	  	<div align="center"  style="border: 1px solid ; margin-top: 20px; min-height:300px; ">
				<div style="font-size: 15px;"> 
				 <span> 各地考勤专员电话 </span>
				 </div>
				 <div style="margin-top: 10px; height: 300px;">
					  	<table align="center" border="1,1,1,1" width="500px;">
					 		<tr >
								 <th width="15%;" height="40px;" style="text-align: center;" >工号</th>
								 <th width="15%;" height="40px;" style="text-align: center;">姓名</th>
								 <th width="15%;" height="40px;" style="text-align: center;">联系方式</th>
								 <th width="15%;" height="40px;" style="text-align: center;">地点</th>
					 		</tr>
					 	<tbody id="tabledy" align="center">
					 	<c:forEach items="${ulist}" var="li">
					 		<tr align="center">
					 		<td>
					 		${li.c_codejob}
					 		</td>
					 		<td>
					 		${li.c_name}
					 		</td>
					 		<td>
					 		${li.c_phone}
					 		</td>
					 		<td>
					 		${li.c_address}
					 		</td>
					 		</tr>
					 	</c:forEach>
					 	</tbody>
					  </table>
			 	 </div>		
			 	 
			 	 
			 <c:if test="${stuaus ==1}">
			 			 	   <!-- Button trigger modal -->
				<div align="right" style="margin-bottom: 10px; margin-right: 10px;" >
				 <button data-method="offset" data-type="auto" class="btn btn-default btn-sm" onclick="insertComs()">添加</button>
				&nbsp;&nbsp;
					<button type="button" class="btn btn-default btn-sm" onclick="delCom()">
					  &nbsp;&nbsp;删除&nbsp;&nbsp;
					</button>
				</div>	
				</c:if>			  		
		 </div>
	 </div>
</div>			
</body>
</html>