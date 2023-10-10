<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>success</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.min.js" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-select.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.mobile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-select.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
</head>
<script type="text/javascript">
$(function(){
	//delayURL("${pageContext.request.contextPath}/main.jsp");
	shownum();

});
var i = 3;
function shownum(){
    i = i-1;
    document.getElementById("time").innerHTML = i + "秒后自动跳转到查询页面!!";
    if(i>0){
        setTimeout('shownum()',1000);
    }else{
    	document.getElementById("clile").click();
    }
}
</script>

<body>
<div style="margin-left: 350px; margin-top: 150px;">
<img alt="加载中"  src="${pageContext.request.contextPath}/images/jiazai.gif">
<span>${suStauts }</span><span id="time">${suStauts }</span>
<a style="display: none" target="mainall" href="${pageContext.request.contextPath}/receiptsList.jsp" id="clile"></a>
</div>
</body>
</html>