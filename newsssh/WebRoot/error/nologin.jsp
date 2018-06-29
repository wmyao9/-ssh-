<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>nologin.jsp</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<style>
    .parent{
    
    background: url("<%=basePath%>/include/img/500.png");
    repeat: no-repeat;
    background-attachment:fixed;
   
			}
	</style>
  </head>
 
  <body class="parent">
<!--      <h1>登录失效</h1>
<p>对不起，您没有登录或者登录已超时。</p> -->
<!-- <img src="./include/img/500.png"></img> -->
<script type="text/javascript">
    setTimeout(reDo, 2000);
    function reDo(){ top.location.href ="<%=basePath%>";  }
</script>
  </body>
</html>
