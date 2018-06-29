<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台管理系统</title>
<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="<%=basePath%>/styles.css">-->

<link rel="stylesheet"
	href="<%=basePath%>/include/css/themes/default/easyui.css">
<link rel="stylesheet" href="<%=basePath%>/include/css/themes/icon.css">
<link rel="shortcut icon" href="<%=basePath%>/include/img/exam.png">

<script src="<%=basePath%>/include/js/jquery.min.js"></script>
<script src="<%=basePath%>/include/js/jquery.easyui.min.js"></script>
<script src="<%=basePath%>/include/js/easyui-lang-zh_CN.js"></script>
<script src="<%=basePath%>/include/js/wmytab.js"></script>

</head>
<!--  <a href="#" id="logout" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出系统</a> -->
<script>
		 $(function(){
			$("#logout").click(function(){
				top.location.href="<%=basePath%>doLogout"
			})
		})
	</script>

<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="background:#B3DFDA;padding:0 10px 0 10px;vertical-align: middle;">
		<img src="<%=basePath%>/include/img/exam.png" width="126" height="50" />
		<div style="float:right;line-height:50px;margin-right:10px;">
			<a href="#" id="logout" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'">退出</a>
		</div>
		<div style="float:right;line-height:50px;margin-right:10px;">登录用户：${me.xm}
			|</div>
	</div>
	<div data-options="region:'west',split:true,title:'系统菜单'"
		style="width:180px;padding:10px;">
		<ul id="menutree" class="easyui-tree"></ul>
	</div>
	<div data-options="region:'south',border:false"
		style="height:30px;padding:5px;text-align:center;font-family: arial;
  color: #A0B1BB;">Copyright
		Online exam @wmy. All Rights Reserved.</div>
	<div data-options="region:'center'">
		<div id="tabs" class="easyui-tabs" fit="true" border="false"></div>
	</div>


</body>
<script>
   $("#menutree").tree({
			url : "<%=basePath%>menu",
			animate : true,
			onClick : function(node) {
				if (!node.attributes) {
					if (!opened_node) {
						$("#menutree").tree('expand', node.target);
						opened_node = node.target;
					} else if (opened_node != node.target) {
						$("#menutree").tree('collapse', opened_node);
						$("#menutree").tree('expand', node.target);
						opened_node = node.target;
					}
				} else {
					swNewTab(node.text, "<%=basePath%>" + node.attributes.url);
				}
			},
			onLoadSuccess : function(node, data) {
				$("#menutree").tree('expandAll');
			}
		});
		$(function(){
        swNewTab('新闻管理',"<%=basePath%>goListNews");
        });

</script>
</html>
