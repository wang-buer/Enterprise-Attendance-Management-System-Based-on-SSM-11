<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function btUsersubmit (){
  		var job_number=$("#job_number").val();//工号
  		var login_name=$("#login_name").val();//姓名
  		var loginId=$("#loginId").val();//登陆名
  		var passWord=$("#passWord").val();//登陆密码
  		var selectRows=$("#selectRows").val();//权限
  		$.ajax({
  			url:"${pageContext.request.contextPath}/login/userInsert.do",
  			type:"get",
  			async:false,
  			data:{
  	  			number:job_number,name:login_name,loginIds:loginId,passWords:passWord,selectRow:selectRows
  	  		},
  	  		success:function(data){
  	  			if(data=='插入成功'){
  	  				selectProfileStyle();
  	  			}
  	  			alert(data);
  	  		}
  		});
  	}	
	function selectProfileStyle(){
		alert("1");
		 var t = $("#table_server_system").bootstrapTable({
			   ajaxOptions: {
                   async: false 
               },  
			 	url: '${pageContext.request.contextPath}/login/userList.do',
		        method: 'get',
		        dataType: "json",
		        striped: true,//设置为 true 会有隔行变色效果
		        undefinedText: "空",//当数据为 undefined 时显示的字符
		        pagination: true, //分页
		        // paginationLoop:true,//设置为 true 启用分页条无限循环的功能。
		        showToggle: "false",//是否显示 切换试图（table/card）按钮
		        showColumns: "true",//是否显示 内容列下拉框
		        pageNumber: 1,//如果设置了分页，首页页码
		        // showPaginationSwitch:true,//是否显示 数据条数选择框
		        pageSize: 5,//如果设置了分页，页面数据条数
		        pageList: [5, 10, 20, 40],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
		        paginationPreText: '‹',//指定分页条中上一页按钮的图标或文字,这里是<
		        paginationNextText: '›',//指定分页条中下一页按钮的图标或文字,这里是>
		        // singleSelect: false,//设置True 将禁止多选
		        search: false, //显示搜索框
		        showRefresh: true,
		        data_local: "zh-US",//表格汉化
		        sidePagination: "server", //服务端处理分页
		        queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的
		            return {//这里的params是table提供的
		                cp: params.offset,//从数据库第几条记录开始
		                ps: params.limit//找多少条
		            };
		        },
		        idField: "id",//指定主键列
		        columns: [
		            {
		                title: '员工工号',//表的列名
		                field: 'job_number',//json数据中rows数组中的属性名
		                align: 'center',//水平居中
		                width: '20%'
		            },
		            {
		                title: '员工姓名 ',//表的列名
		                field: 'login_name',//json数据中rows数组中的属性名
		                align: 'center',//水平居中
		                width: '20%'
		            },

		            {
		                title: '登陆用户名',//表的列名
		                field: 'loginId',//json数据中rows数组中的属性名
		                align: 'center',//水平居中
		                width: '20%'
		            },
		            {
		                title: '登陆密码',
		                field: 'passWord',
		                align: 'center'
		            },
		            {
		                title: '所属权限',
		                field: 'role_name',
		                align: 'center'
		            },
		            {
		                title: '操作',
		                field: 'id',
		                align: 'center',
		                formatter: function (value, row, index) {//自定义显示可以写标签哦~
		                   
		                	 var id = value;
		                     var result = "";
		                     result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
		                     result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteByIds('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
		                	return result;
		                }
		            }
		 
		        ]
		    });
		 
		 
		    t.on('load-success.bs.table', function (data) {//table加载成功后的监听函数
		        console.log("load success");
		        $(".pull-right").css("display", "none");
		    });	
	}
</script>
