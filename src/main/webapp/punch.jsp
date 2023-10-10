<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打卡</title>
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

function colse(){
	parent.layer.closeAll();
	
	
}

layui.use('form', function(){
	  var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	   // layer.msg(JSON.stringify(data.field));
	   //	document.cmyform.action="${pageContext.request.contextPath}/adept/updateAdept.do";
	//	document.cmyform.submit();
	   // return false;
	   
	  var id=$("#emp_id").val();
	   $.ajax({
		  url: "${pageContext.request.contextPath}/punch/punchPut.do",
		  dataType:"json",
		  data:{"id":id},
          success:function (data,status) {
	             layer.alert(data);
	          },
	          error:function (res) {
	              layer.alert('打卡成功');
	          }
	   });
	  });
	});
</script>
<body>
<!-- 插入部门Modal -->
<div class="container">
  <div class="layui-inline" style="margin-top: 10px;">
    <div class="layui-input-block">
      <input type="hidden" name="emp_id" id="emp_id" value="${teID}"  class="form-control">
    </div>
  </div>
 
      <div align="center" style="margin-top: 55px;">
        <button type="button" onclick="btsubmits()" lay-submit lay-filter="formDemo" class="btn btn-default layui-anim-scale" style="width: 200px;height: 100px;font-size: 25px;">&nbsp;<span class="glyphicon glyphicon-hand-up"></span>&nbsp;</button>
      </div>
      </div>
</body>
</html>