<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统用户管理</title>
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
layui.use('form', function(){
	  var form = layui.form;
	  form.verify({
		 number1: [/^[0-9]*$/, '必须输入数字啊'],
      });
	  //监听提交
	//  form.on('submit(formDemo)', function(data){
	   // layer.msg(JSON.stringify(data.field));
	   //	document.cmyform.action="${pageContext.request.contextPath}/comiss/comInsert.do";
		//document.cmyform.submit();
	   // return false;
	 // });
	  form.on('submit(formDemo)', function(data){
		var id=  $("#hiId").val();
		if(id=='' || id==null){
			id="1";
		}
		var job_number=  $("#job_number").val();
		var login_name=  $("#login_name").val();
		var loginId=  $("#loginId").val();
		var passWord=  $("#passWord").val();
		var selectName=  $("#selectName").val(); 
		var statusAD=  $("#statusAD").val();
		var url=null;
		if(statusAD != 2){
			url="<%=request.getContextPath()%>/login/updateuser.do";
		}else{
			url="<%=request.getContextPath()%>/login/userInsert.do";
		}
		$.ajax({
				     url:url
			          ,type:'get',
			          dataType:'json',
			          data:{
			        	  'id':id,
			        	  'job_number':job_number,
			        	  'login_name':login_name,
			        	  'loginId':loginId,
			        	  'passWord':passWord,
			        	  'selectName':selectName
			          },
			          success:function (data,status) {
			             layer.alert(data);
			          },
			          error:function (res) {
			              layer.alert('操作成功');
			          }
				
			})
		
	  });
 
	});
	
	
function colse(){
	parent.layer.closeAll();
	
	
}

</script>
<body>
<!-- 插入编辑用户Modal -->
<div class="container">
  <form class="layui-form-item layui-form layui-form-pane" id="cmyform" name="cmyform" target="mainall">
  	<input type="hidden" id="hiId" value="${id}">
  	<input type="hidden" id="statusAD" value="${statusAdd}">
  <div class="layui-inline" style="margin-top: 20px;">
    <label class="layui-form-label" >员工工号:</label>
    <div class="layui-input-block" align="left">
      <input type="text" value="${job_number }" name="job_number" id="job_number"  maxlength="15"  lay-verify="required|number1" placeholder="请输入" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >员工姓名:</label>
    <div class="layui-input-block">
      <input type="text" value="${login_name }" name="login_name" id="login_name" required  lay-verify="required" placeholder="姓名" maxlength="10" autocomplete="off" class="form-control">
    </div>
  </div>
  	  <div class="layui-inline">
    <label class="layui-form-label" >所属权限:</label>
    <div class="layui-input-block">
 	<select name="city"  id="selectName" lay-verify="required">
       <c:if test="${role_name  eq '员工'}">
               <option value="0" selected="selected">员工</option>
                <option value="1" >管理员</option>
       </c:if>
        <c:if test="${role_name eq '管理员'}">
 		<option value="1" selected="selected">管理员</option>
 		 <option value="0" >员工</option>
        </c:if>
       <c:if test="${statusAdd eq '2'}">
       		<option value="1">管理员</option>
 		 <option value="0" >员工</option>
       </c:if>
    </select>   
      </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >用户名:</label>
    <div class="layui-input-block">
      <input type="text" value="${loginId }" maxlength="12" name="loginId" id="loginId" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >用户密码:</label>
    <div class="layui-input-block">
      <input type="text" value="${passWord }" maxlength="12" name="passWord" id="passWord" required  lay-verify="required" placeholder="密码" autocomplete="off" class="form-control">
    </div>
  </div>
   <div class="modal-footer">
      <div style="margin-right: 120px;">
        <button type="button" class="btn btn-primary"  onclick="colse()" >&nbsp;关闭&nbsp;</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="btsubmits()" lay-submit lay-filter="formDemo" class="btn btn-primary" >&nbsp;确认&nbsp;</button>
      </div>
    </div>
</form>
      </div>
</body>
</html>