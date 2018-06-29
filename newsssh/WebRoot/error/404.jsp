<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '404.jsp' starting page</title>
<%--     <link img href="<%=basePath%>include/img/404.jpg"> --%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
    .parent{
    background: url("<%=basePath%>/include/img/404.jpg");
    hight:100%;
    width:100%;   
   			}
	</style>
  </head>
  
   <body class="parent">
<!--      <h1>登录失效</h1>
<p>对不起，您没有登录或者登录已超时。</p>
<img src="./include/img/500.png"></img> -->
  </body>
</html>
