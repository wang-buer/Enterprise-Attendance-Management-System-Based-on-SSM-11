<%@ page language="java" contentType="text/html; pageEncoding=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电子单据列表</title>
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
		    ,url: '${pageContext.request.contextPath}/receipt/receiptList.do'
		    ,limit: 10
	         ,id:'id'
		    ,cols: [[ //表头
		       {type:'checkbox'}
		      ,{field: 'eid', title: '员工工号', width:110,sort: true , align:'center'}
		      ,{field: 'ename', title: '姓名', width:100 , align:'center'}
		      ,{field: 'start_time', title: '开始时间', width:160,sort: true , align:'center'}
		      ,{field: 'end_time', title: '结束时间', width:160 , align:'center'}
		      ,{field: 'leave_type', title: '类别', width:90 , align:'center'}
		      ,{field: 'leave_day', title: '请假(小时/天)数', templet:'#sta_day', width:140 , align:'center'}
		      ,{field: 'evection_day', title: '出差天数', templet:'#station_day', width:110 , align:'center'}
		      ,{field: 'forget_data', title: '忘记打卡日期', width:140 , align:'center'}
		      ,{field: 'affert_data', title: '实际上班时间', width:140 , align:'center'}
		      ,{field: 'afternoon_data', title: '实际下班时间', width:140 , align:'center'}
		      ,{field: 'site', title: '出差地点', width:120 , align:'center'}
		      ,{field: 'expense', title: '预支费用', width:110 , align:'center'}
		      ,{field: 'describes', title: '描述', width:160 , align:'center'}		      
		      ,{field: 'status_name', title: '审批状态', width:110 , align:'center'}		      
		      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:120}
		      ]]
		    ,page: true //开启分页
	     
		  });
	
		  
		  //监听行工具事件
		  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'detail'){
		      layer.msg('查看操作');
		    } else if(layEvent === 'del'){
		      layer.confirm('是否撤销', function(index){
		        obj.del(); //删除对应行（tr）的DOM结构
		        layer.close(index);
		        //向服务端发送删除指令
		        $.ajax({
                    url:'${pageContext.request.contextPath}/receipt/delReceipt.do',
                    type:'get',
                    dataType:'json',
                    data:{
                    	id:data.id
                    },
                    success:function (data,status) {
                       layer.alert(data);
                    },
                    error:function (res) {
                        layer.alert('撤销成功');
                    }
                });
		      });
		    } else if(layEvent === 'edit'){
		      $.ajax({
                  url:'${pageContext.request.contextPath}/receipt/updateReceipt.do',
                  type:'get',
                  dataType:'json',
                  data:{
                  	id:data.id,
                  	eId:data.eid,
                  	pdata:data.forget_data,
                  	aff:data.affert_data,
                  	afrt:data.afternoon_data
                  },
                  success:function (data,status) {
                     dictable.reload(
				             {
				            	  url: '${pageContext.request.contextPath}/receipt/receiptList.do'					            
				            });
                  },
                  error:function (res) {
                      layer.alert('审批成功');
                      dictable.reload(
 				             {
 				            	  url: '${pageContext.request.contextPath}/receipt/receiptList.do'					            
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

{{# if (${stuaus}=== 1) { }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">审核</a>
{{# }  }}
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">撤销</a>

</script>
<script type="text/javascript" id="sta_day">
{{
	getday(d.leave_day) 
}}
</script>
<script type="text/javascript" id="station_day">
{{
	getdaystp(d.evection_day) 
}}
</script>
<script type="text/javascript">
function getday(leave_day){
	if(leave_day==1.9){
		return "1h";
	}else if(leave_day==4){
		return "4h";
	}else if(leave_day==1){
		return "1天";
	}else if(leave_day==3){
		return "3天";
	}else if(leave_day==7){
		return "7天";
	}else {
		return "";
	}
	
	
}

</script>
<script type="text/javascript" >
function getdaystp(evection_day){
	if(evection_day==3){
		return "3天";
	}else if(evection_day==7){
		return "7天";
	}else if(evection_day==30){
		return "30天";
	
	}else if(evection_day==90){
		return "90天";
	}else {
		return "";
	}	
}
</script>
<body>
  <div align="center" class="container">
   
<table id="test" lay-filter="test"  class="layui-table" >
</table>
  </div>
</body>
</html>