<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘打卡单据</title>
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
function colse (){
	window.location.href="${pageContext.request.contextPath}/receiptsList.jsp";
}


layui.use(['form','laydate','laytpl','laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	  var form = layui.form;
	  var laydate = layui.laydate;
	  laydate.render({
		    elem: '#test1' //指定元素
		    ,zIndex: 99999999
		    ,type: 'time'
		  });
	  laydate.render({
		    elem: '#test2' //指定元素
		    ,zIndex: 99999999
		    ,type: 'time'
		  });
	  laydate.render({
		    elem: '#test3' //指定元素
		    ,zIndex: 99999999
		    ,type: 'date'
		  });
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	   // layer.msg(JSON.stringify(data.field));
	   	document.cmyform.action="${pageContext.request.contextPath}/receipt/insertReceipt.do";
		document.cmyform.submit();
	   // return false;
	  });
	});
</script>
<body>
<!-- 插入部门Modal -->
<div class="container">
<div class="layui-container" style="margin-top: 5px;">  
   <form class="layui-form-item layui-form layui-form-pane" id="cmyform" name="cmyform" target="mainall">
 <div class="layui-row">
	  <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
			 <div class="layui-inline">
			    <label class="layui-form-label" >类别:</label>
			    <div class="layui-input-block">
				 	<select name="leave_type"  id="leave_type" lay-verify="required">
				   <option value="忘打卡" >忘打卡</option>
				    </select>   
			      </div>
			  </div>
		  </div>
		      	<div class="layui-inline" style="margin-top: 10px;">
		    <label class="layui-form-label" >忘打卡日期:</label>
		    <div class="layui-input-block">
		      <input type="text" name="forget_data" id="test3" required  v lay-verify="required" placeholder="日期" autocomplete="off" class="form-control">
		    </div>
	  </div>
</div>
   <div class="layui-row" >
	  <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
			<div class="layui-inline">
			    <label class="layui-form-label" >上班时间:</label>
			    <div class="layui-input-block">
			      <input type="text" name="affert_data" id="test1" required  v lay-verify="required" placeholder="上班时间" autocomplete="off" class="form-control">
			    </div>
	  		</div>
	  </div>
    <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
    	<div class="layui-inline" >
		    <label class="layui-form-label" >下班时间:</label>
		    <div class="layui-input-block">
		      <input type="text" name="afternoon_data" id="test2" required  v lay-verify="required" placeholder="下班时间" autocomplete="off" class="form-control">
		    </div>
	  </div>
 	 </div>
  </div>
 
  <div class="layui-row">
	   <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
		  <div class="layui-inline">
		    <label class="layui-form-label" >工号:</label>
		    <div class="layui-input-block" >
		      <input type="text" name="eid" id="eid" maxlength="15" value="${eID }" required  lay-verify="required" placeholder="工号" autocomplete="off" class="form-control">
		    </div>
		  </div>   
	  
	   </div>
	    <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
		 
		   <div class="layui-inline" style="margin-top: 10px;">
		    <label class="layui-form-label" >姓名:</label>
		    <div class="layui-input-block">
		      <input type="text" name="ename"  maxlength="10" id="ename" required  v lay-verify="required" placeholder="姓名" value="${ename }" autocomplete="off" class="form-control">
		    </div>
		  </div>
	    </div>
  </div>
  <div class="layui-row">
	  <div class="layui-col-xs10 layui-col-sm12 layui-col-md10">
		    <div class="layui-inline">
		    <label class="layui-form-label" >描述:</label>
			    <div class="layui-input-block">
			 <textarea placeholder="请输入内容" class="layui-textarea" id="describes" name="describes" style="width: 550px;"></textarea>  
			 
			   </div>
		  </div>
	  </div>
  </div>
  </div>

 <div class="modal-footer">
      <div align="center" style="margin-left: -400px;">
        <button type="button" class="btn btn-primary"  onclick="colse()" >&nbsp;返回&nbsp;</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="btsubmits()" lay-submit lay-filter="formDemo" class="btn btn-primary" >&nbsp;确认&nbsp;</button>
      </div>
    </div>
</form>
</div>

      </div>
</body>
</html>