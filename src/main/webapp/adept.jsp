<%@ page language="java" contentType="text/html; pageEncoding=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门信息管理</title>
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
</head>
<script type="text/javascript">
	
	layui.use(['laydate','laytpl','laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
		  var table = layui.table;
		  //第一个实例
		  var dictable=table.render({
		    elem: '#test'
		   	,width: 1100
		    ,height: 350
		    ,url: '${pageContext.request.contextPath}/adept/adeptList.do'
		    ,limit: 10
	         ,id:'adept_id'
		    ,cols: [[ //表头
		       {type:'checkbox'}
		      ,{field: 'adept_id', title: '部门工号', width:170,sort: true , align:'center'}
		      ,{field: 'adept_name', title: '部门名称', width:190 , align:'center'}
		      ,{field: 'adept_ads', title: '部门描述', width:550 , align:'center'}
		      ,{fixed: 'right', width:125, align:'center', toolbar: '#barDemo'}
		    ]]
		    ,page: true //开启分页
	     
		  });
		  

		  var $ = layui.$, active={
					  reload:function () {
						 var demoReload = $('#demoReload').val();
			              var searchSize = $('#demoReloadName').val();
			              dictable.reload(
			             {
			            	  url: '<%=request.getContextPath()%>/adept/adeptList.do'
			            	  ,where:{'keyword':demoReload,'keywordname':searchSize}
			            
			              });
			          },
			          addUser:function(){
			        	  	parent.layer.open({
			    				type: 2,
			    		        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 添加用户</h4>",
			    		        area: ['500px', '400px'],
			    		        skin: 'demo-class',
			    				  content: '<%=request.getContextPath()%>/adeptInsert.jsp',
			    				  end : function(layero, index){
			    					    dictable.reload(
			    					             {
			    					            	  url: '<%=request.getContextPath()%>/adept/adeptList.do'					            
			    					              });
			    					  }
			    				}); 
			        	  
			          }
	        };
		  
		  //监听行工具事件
		  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'detail'){
		      layer.msg('查看操作');
		    } else if(layEvent === 'del'){
		      layer.confirm('真的删除行么', function(index){
		        obj.del(); //删除对应行（tr）的DOM结构
		        layer.close(index);
		        //向服务端发送删除指令
		        $.ajax({
                    url:'<%=request.getContextPath()%>/adept/delAdept.do',
                    type:'get',
                    dataType:'json',
                    data:{
                    	id:data.adept_id
                    },
                    success:function (data,status) {
                       layer.alert(data);
                    },
                    error:function (res) {
                        layer.alert('删除成功');
                    }
                });
		      });
		    } else if(layEvent === 'edit'){
		      var url="<%=request.getContextPath()%>/adept/upserAdept.do?adept_id="+data.adept_id+"&adept_name="+data.adept_name+"&adept_ads="+data.adept_ads;		      
		      parent.layer.open({
				type: 2,
		        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 修改用户</h4>",
		        area: ['500px', '400px'],
		        skin: 'demo-class',
				  content: url,
				  end : function(layero, index){
					    dictable.reload(
					             {
					            	  url: '<%=request.getContextPath()%>/adept/adeptList.do'					            
					              });
					  }
				}); 
		      
		    }
		  });
		  
	        $('.demoTable .layui-btns1').on('click', function(){
	           var type = $(this).data('type');
	            active[type] ? active[type].call(this) : '';
	        });

		});       
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<body>
  <div align="center" class="container">
        <div class="demoTable layui-form-pane" align="left" style="margin-top: 20px; margin-bottom: -15px; margin-left: 20px;">   
   
   		<table>
   		<tr>
   		<td>
   		    <label class="layui-form-label" >工号:</label>
   		</td>
   		<td>
		<div class="layui-inline">   
				<input class="layui-input" name="keyword" id="demoReload" autocomplete="off"> 			
		 </div>
   		</td>
   				<td>
   		    <label class="layui-form-label" >部门名称:</label>
   		</td>
   		<td>
		<div class="layui-inline">   
				<input class="layui-input" name="keywordname"  id="demoReloadName" autocomplete="off"> 			
		 </div>
   		</td>
   		<td>
   			&nbsp;&nbsp;<button class="layui-btn layui-btns1"  data-type="reload">搜索</button> 
   		</td>
   		<td>   	&nbsp;&nbsp;&nbsp;&nbsp;	<button class="layui-btn layui-btns1"  data-type="addUser">添加部门</button> 
   		</td>
   		</tr>
   		</table>
   		</div>
<table id="test" lay-filter="test"  class="layui-table" >
</table>
  </div>
</body>
</html>