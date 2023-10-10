<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除考勤专员</title>
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
			  numberd: [/^[0-9]*$/, '必须输入数字啊'],
	    });
	  //监听提交
	  form.on('submit(formDemoDel)', function(data){
	   // layer.msg(JSON.stringify(data.field));
		document.delform.action="${pageContext.request.contextPath}/comiss/delc.do";
		document.delform.submit();
		   // return false;
	  });
	});
function colse(){
	parent.layer.closeAll();
	
	
}
/* function delsubmits (){
	var c_codejob=$("#c_codejob").val();
	var c_name=$("#c_name").val();
	var c_address=$("#c_address").val();
	var c_phone=$("#c_phone").val();
} */
</script>
<body>
<!-- 删除专员Modal -->
<div class="container">
   <form class="layui-form-item layui-form layui-form-pane" id="delform" name="delform" target="mainall">
  	
  <div class="layui-inline" style="margin-top: 20px;">
    <label class="layui-form-label" >工号:</label>
    <div class="layui-input-block" align="left">
      <input type="text" name="c_codejob" id="c_codejob" required  lay-verify="required|numberd" placeholder="工号" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >姓名:</label>
    <div class="layui-input-block">
      <input type="text" name="c_name" id="c_name" required  lay-verify="required" placeholder="姓名" autocomplete="off" class="form-control">
    </div>
  </div>
   <div class="modal-footer">
      <div style="margin-right: 100px;">
        <button type="button" class="btn btn-primary" onclick="colse()" >&nbsp;关闭&nbsp;</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="delsubmits()" lay-submit lay-filter="formDemoDel" class="btn btn-primary" >&nbsp;确认&nbsp;</button>
      </div>
    </div>
</form>
      </div>
</body>
</html>