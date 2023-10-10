<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加考勤专员</title>
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
function btsubmits (){
	var c_codejob=$("#c_codejob").val();
	var c_name=$("#c_name").val();
	var c_address=$("#c_address").val();
	var c_phone=$("#c_phone").val();
	//document.cmyform.action="${pageContext.request.contextPath}/comiss/comInsert.do?";
	//document.cmyform.submit();
}
function colse(){
	parent.layer.closeAll();
	
	
}

layui.use('form', function(){
	  var form = layui.form;
	  
	  form.verify({
		 // number: [/^[0-9]*$/, '必须输入数字啊'],
		  number1: function(value) {
          var oldEnname = $("#c_codejob").val(); //获取旧名称值
          var reg = new RegExp("^[0-9]*$");
          var obj = oldEnname;
		       if(!reg.test(obj)){
		    	   boole=false;
		           return "请输入数字";
		       }else{
          
          var msg = "";
          $.ajax({
              type: "get",
              url: '${pageContext.request.contextPath}/comiss/ajaxLists.do',
              async:false,//同步提交。不设置则默认异步，异步的话，最后执行ajax
              data: {
            	  number: value,
                  oldEnname: oldEnname
              },
              success: function(result) {
            	  if(result ==false) {
            		  msg="工号已存在";
            	  } 
              },
              error: function(error) {
                  alert(error.status);
              }
          });
          return msg;
		       }
         
      }
      });
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	   // layer.msg(JSON.stringify(data.field));
	   	document.cmyform.action="${pageContext.request.contextPath}/comiss/comInsert.do";
		document.cmyform.submit();
	   // return false;
	  });
	});
</script>
<body>
<!-- 插入专员Modal -->
<div class="container">
   <form class="layui-form-item layui-form layui-form-pane" id="cmyform" name="cmyform" target="mainall">
  	
  <div class="layui-inline" style="margin-top: 20px;">
    <label class="layui-form-label" >工号:</label>
    <div class="layui-input-block" align="left">
      <input type="text" maxlength="15" name="c_codejob" id="c_codejob"   lay-verify="required|number1" placeholder="请输入" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >姓名:</label>
    <div class="layui-input-block">
      <input type="text" name="c_name" maxlength="10" id="c_name" required  lay-verify="required" placeholder="姓名" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >电话:</label>
    <div class="layui-input-block">
      <input type="text" name="c_phone" maxlength="15" id="c_phone" required  lay-verify="required" placeholder="电话" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" >地址:</label>
    <div class="layui-input-block">
      <input type="text" name="c_address" maxlength="18" id="c_address" required  lay-verify="required" placeholder="地址" autocomplete="off" class="form-control">
    </div>
  </div>
   <div class="modal-footer">
      <div style="margin-right: 100px;">
        <button type="button" class="btn btn-primary"  onclick="colse()" >&nbsp;关闭&nbsp;</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="btsubmits()" lay-submit lay-filter="formDemo" class="btn btn-primary" >&nbsp;确认&nbsp;</button>
      </div>
    </div>
</form>
      </div>
</body>
</html>