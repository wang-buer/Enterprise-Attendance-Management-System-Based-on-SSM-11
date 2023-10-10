<%@ page language="java" contentType="text/html; pageEncoding=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息管理</title>
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
		  var laytpl = layui.laytpl;
		  var laydate = layui.laydate;
		  //第一个实例
		  var dictable=table.render({
		    elem: '#test'
		   	,width: 1100
		    ,height: 350
		    ,url: '<%=request.getContextPath()%>/getEmpList/getemList.do' //数据接口
		    ,limit: 10
	         ,id:'employee_id'
		    ,cols: [[ //表头
		       {type:'checkbox'}
		      ,{field: 'employee_id', title: '员工工号', width:120,sort: true , align:'center'}
		      ,{field: 'employee_name', title: '员工名称', width:120 , align:'center'}
		      ,{field: 'sex', title: '性别', width:70 , align:'center'}
		      ,{field: 'phone', title: '电话', width:180, sort: true , align:'center'}
		      ,{field: 'join_time', title: '加入时间',  width:160 ,templet:'#sta_time',sort: false,fixed:false,  align:'center'} 
		      ,{field: 'number', title: '身份证号码', width: 160 , align:'center'}
		      ,{field: 'deptname', title: '所属部门', width: 90 , align:'center'}
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
			            	  url: '<%=request.getContextPath()%>/getEmpList/getemList.do'
			            	  ,where:{'keyword':demoReload,'keywordname':searchSize}
			            
			              });
			          },
			          addUser:function(){
			        	  	parent.layer.open({
			    				type: 2,
			    		        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 添加用户</h4>",
			    		        area: ['500px', '400px'],
			    		        skin: 'demo-class',
			    				  content: '<%=request.getContextPath()%>/addEmployee.jsp',
			    				  end : function(layero, index){
			    					    dictable.reload(
			    					             {
			    					            	  url: '<%=request.getContextPath()%>/getEmpList/getemList.do'					            
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
                    url:'<%=request.getContextPath()%>/getEmpList/delEmplo.do',
                    type:'get',
                    dataType:'json',
                    data:{
                    	employee_id:data.employee_id
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
		      var url="<%=request.getContextPath()%>/getEmpList/selectUpdateEmplo.do?employee_id="+data.employee_id+"&employee_name="+data.employee_name+"&sex="+data.sex+"&phone="+data.phone+"&number="+data.number+"&deptname="+data.deptname+"&adept_code="+data.adept_code;		      
		      parent.layer.open({
				type: 2,
		        title: "<h4 align='center' style='font-size:20px; margin-top: 6px;'><p class='glyphicon glyphicon-user'></p> 修改用户</h4>",
		        area: ['500px', '400px'],
		        skin: 'demo-class',
				  content: url,
				  end : function(layero, index){
					    dictable.reload(
					             {
					            	  url: '<%=request.getContextPath()%>/getEmpList/getemList.do'					            
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
<script type="text/javascript" id="sta_time">
{{
	gettime(d.join_time)
}}
</script>
<script type="text/javascript">
function Format(datetime,fmt) {
	  if (parseInt(datetime)==datetime) {
	    if (datetime.length==10) {
	      datetime=parseInt(datetime)*1000;
	    } else if(datetime.length==13) {
	      datetime=parseInt(datetime);
	    }
	  }
	  datetime=new Date(datetime);
	  var o = {
	  "M+" : datetime.getMonth()+1,                 //月份   
	  "d+" : datetime.getDate(),                    //日   
	  "h+" : datetime.getHours(),                   //小时   
	  "m+" : datetime.getMinutes(),                 //分   
	  "s+" : datetime.getSeconds(),                 //秒   
	  "q+" : Math.floor((datetime.getMonth()+3)/3), //季度   
	  "S"  : datetime.getMilliseconds()             //毫秒   
	  };   
	  if(/(y+)/.test(fmt))   
	  fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));   
	  for(var k in o)   
	  if(new RegExp("("+ k +")").test(fmt))   
	  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	  return fmt;
	}
function gettime (time){
	//alert(Format("1507353913000","yyyy-M-d h:m:s.S"));
    return Format(time,"yyyy年MM月dd");
}
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
   		    <label class="layui-form-label" >姓名:</label>
   		</td>
   		<td>
		<div class="layui-inline">   
				<input class="layui-input" name="keywordname"  id="demoReloadName" autocomplete="off"> 			
		 </div>
   		</td>
   		<td>
   			&nbsp;&nbsp;<button class="layui-btn layui-btns1"  data-type="reload">搜索</button> 
   		</td>
   		<td>   	&nbsp;&nbsp;&nbsp;&nbsp;	<button class="layui-btn layui-btns1"  data-type="addUser">添加用户</button> 
   		</td>
   		</tr>
   		</table>
   		</div>
<table id="test" lay-filter="test"  class="layui-table" >
</table>
  </div>
</body>
</html>