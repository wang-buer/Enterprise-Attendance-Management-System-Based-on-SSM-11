<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>企业考勤管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.min.js">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.mobile.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
    <script>
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            element.init();
            //监听导航点击
            element.on('nav(demo)', function (elem) {
                console.log(elem)
            });

            layui.use('layer', function () {
                var layer = layui.layer;
            });
        });
    </script>
</head>
<body style="border-style:none; background-image: url('${pageContext.request.contextPath}/images/login.jpg');background-repeat: no-repeat;  background-attachment: fixed; background-size:100% 100%; min-width: 1010px; height: 550px; margin-top: -30px;margin-left: 10px;">
<input id="hdel" type="text" value="${desuccess }">
<div class="container-fluid" style="margin-top: 100px;  ">
    <ul class="layui-nav ">
        <li class="layui-nav-item layui-this"><a target="mainall"
                                                 href="${pageContext.request.contextPath}/comiss/comissList.do">首页</a>
        </li>
        <li class="layui-nav-item ">
            <a href="javascript:;">我的工作</a>
            <dl class="layui-nav-child ">
                <dd><a target="mainall" href="${pageContext.request.contextPath}/receiptsList.jsp">电子单据列表</a></dd>
                <dd style="margin-top: 10px;"><a target="mainall" href="${pageContext.request.contextPath}/leave.jsp">请假电子单据</a>
                </dd>
                <dd style="margin-top: 10px;"><a target="mainall"
                                                 href="${pageContext.request.contextPath}/evection.jsp">出差电子单据</a></dd>
                <dd style="margin-top: 10px;"><a target="mainall" href="${pageContext.request.contextPath}/forget.jsp">忘打卡电子单据</a>
                </dd>
            </dl>
        </li>
        <c:if test="${roleBean.g_role_status==1}">
            <li class="layui-nav-item"><a href="javascript:;">基本信息管理</a>
                <dl class="layui-nav-child">
                    <dd><a target="mainall" href="${pageContext.request.contextPath}/employee.jsp">员工信息管理</a></dd>
                    <dd style="margin-top: 10px;"><a target="mainall"
                                                     href="${pageContext.request.contextPath}/adept.jsp">部门信息管理</a></dd>
                </dl>
            </li>
        </c:if>
        <li class="layui-nav-item">
            <a href="javascript:;">考勤信息管理</a>
            <dl class="layui-nav-child">
                <dd><a target="mainall" href="${pageContext.request.contextPath}/punchList.jsp">考勤信息列表</a></dd>
                <c:if test="${roleBean.g_role_status==1}">
                    <dd style="margin-top: 10px;"><a target="mainall"
                                                     href="${pageContext.request.contextPath}/punchListBean.jsp">月考勤统计</a>
                    </dd>
                </c:if>
            </dl>

        </li>
        <c:if test="${roleBean.g_role_status==1}">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/login/usertab.do" target="mainall">系统用户管理</a>
            </li>
        </c:if>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/punch.jsp" target="mainall">打卡</a></li>
        <div align="right" style="margin-top: -30px;color: #ffffff;">
            <span style="color: white; text-align: center;">欢迎${eBean.role_name }【${eBean.login_name }】登陆考勤管理系统
                <a style="color: #72cb17" href="${pageContext.request.contextPath}/login.jsp">退出</a>
            </span>
        </div>

    </ul>

</div>
<iframe name="mainall" src="${pageContext.request.contextPath}/comiss/comissList.do" frameborder="0" width="100%"
        height="450px;" scrolling="auto">
</iframe>
</body>
</html>