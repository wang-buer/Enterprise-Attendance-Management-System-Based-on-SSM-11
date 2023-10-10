<%@ page language="java" contentType="text/html; pageEncoding=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; ">
<title>添加员工</title>
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
/* 	$.ajax({
		url:"${pageContext.request.contextPath}/getEmpList/selectOption.do",
		type:"get",
		dataType:"json",
		success:function(data,stusts){
			for(var i=0; i<data.length; i++){
				$("#selectName").append("<option   value='"+data[i].adept_id+"'  >"+data[i].adept_name+"</option>");
			}
			renders();
		}
		
	}) */

});
 function  renders(){
	 
	  layui.use('form', function(){
		   var form = layui.form;//高版本建议把括号去掉，有的低版本，需要加()
		   form.render();
		  });
 }

function colse(){
	parent.layer.closeAll();
	}
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	   // layer.msg(JSON.stringify(data.field));
	   	document.cmyform.action="${pageContext.request.contextPath}/getEmpList/upEmplo.do";
		document.cmyform.submit();
	   // return false;
	  });
	});
</script>
<body>
<!-- 插入员工Modal -->
<div class="container">
   <form class="layui-form-item layui-form layui-form-pane" id="cmyform" name="cmyform" target="mainall">
  	
  <div class="layui-inline" style="margin-top: 20px;">
    <label class="layui-form-label" >员工姓名:</label>
    <div class="layui-input-block" align="left">
       <input type="hidden" name="employee_id" id="employee_id" value="${employee_id}"  lay-verify="required" placeholder="姓名" autocomplete="off" class="form-control">
      <input type="text"  maxlength="10" name="employee_name" id="employee_name" value="${employee_name}"  lay-verify="required" placeholder="姓名" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >性别:</label>
    <div class="layui-input-block">
      <input type="text" name="sex" maxlength="10" id="sex" value="${sex}" required  lay-verify="required" placeholder="性别" autocomplete="off" class="form-control">
    </div>
  </div>
<!--    <div class="layui-inline">
    <label class="layui-form-label" >所属部门:</label>
    <div class="layui-input-block">
 	<select name="adept_code"   id="selectName" lay-verify="required">
    <option>请选择</option>
    </select>   
      </div>
  </div> -->
   <div class="layui-inline">
    <label class="layui-form-label" >所属部门:</label>
    <div class="layui-input-block">
      <input type="text" name="deptname" maxlength="13" id="deptname" disabled="disabled" value="${deptname}" required  lay-verify="required" placeholder="电话" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >电话:</label>
    <div class="layui-input-block">
      <input type="text" name="phone" maxlength="15" id="phone" value="${phone }" required  lay-verify="required" placeholder="电话" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >身份证号码:</label>
    <div class="layui-input-block">
      <input type="text" name="number" id="number" maxlength="19" value="${number }" required  lay-verify="required" placeholder="身份证号码" autocomplete="off" class="form-control">
    </div>
  </div>
   <div class="modal-footer">
      <div style="margin-right: 150px;">
      	<input type="hidden" name="adept_code" value="${adept_code }"/>
        <button type="button" class="btn btn-primary"  onclick="colse()" >&nbsp;关闭&nbsp;</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="btsubmits()" lay-submit lay-filter="formDemo" class="btn btn-primary" >&nbsp;确认&nbsp;</button>
      </div>
    </div>
</form>
      </div>
</body>
</html>