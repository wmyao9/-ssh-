<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->

<link rel="stylesheet" href="./include/css/style.css">
<link rel="stylesheet" href="./include/css/themes/default/easyui.css">
<link rel="stylesheet" href="./include/css/themes/icon.css">
<link rel="shortcut icon" href="./include/img/exam.png">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="./include/css/reset.css">
<link rel="stylesheet" href="./include/css/supersized.css">
<link rel="stylesheet" href="./include/css/style.css">

<style type="text/css">
.l-wrap {
    margin: 50px 0 0 150px;
    clear: both;
    float: right;   
    width: 80%;
    float: left;
}

.l-news .l-wrap div{
    min-height: 10px;
}
.l-news {
    line-height: 26px;
    margin-bottom: 14px;
}
.l-news .nheader h3 {
    color: #fff;
    margin: 0;
    padding: 0;
    border-width: 0;
    list-style: none;
}
.l-news .nheader {
    background: #a00;
    border-bottom: solid 2px #555;
    line-height: 24px;
    height: 24px;
    padding: 3px 10px 3px 20px;
    background: #eee;
    border-bottom: solid 2px #c00;
    border-top-left-radius: 14px;
    border-top-right-radius: 14px;
}
.l-news .nheader h2 {
    font-size: 14px;
    color: #c00;
    margin: 0;
    padding: 0;
    border-width: 0;
    list-style: none;    
}    
.l-news .nlist{background-color: rgba(255,255,255,0.5); }

</style>

</head>

<body>
	<div style="float:right;padding‐right:20px;">
		  <a id="a" href="#" style="margin‐right:15px;">登录</a>    
		<a id="b" href="#">新闻</a> 
	</div>
	 
	<div id="lnews" class="l-wrap">
		<div class="l-news">
			<div class="nheader">
				<table>
					<tbody>
						<tr>
							<td><h2>通知新闻：</h2></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="nlist" style="text-align:left;" >
				<table id="newstable">
					<tbody>
						<tr id="trpp">
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="pp" style="background:#d8f8f7;"></div>
		</div>
	</div>

	<div id="llogin">
	<div class="page-container">
		<h1>用户登录</h1>
		<form id="login_form" onsubmit="return false">
			<input type="text" id="uid" name="uid" class="username" placeholder="用户名"> 
			<input type="password" id="pwd" name="pwd" class="password" placeholder="密码">
			<button type="submit" id="login_submit">登录</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
		<div class="connect">
			<p>第三方账号登录：</p>
			<p>
				<a class="facebook" href="#"></a> <a class="twitter" href="#"></a>
			</p>
		</div>
	</div>
	<span>还没有帐号？</span>
	<a href="#">立即注册</a>
	<br />
	<br />
	<p>
	<div align="center">
		在线考试系统@wmy</a>
	</div>
	</p>
	</div>

<script src="./include/js/jquery.min.js"></script>
<script src="./include/js/jquery.easyui.min.js"></script>
<script src="./include/js/easyui-lang-zh_CN.js"></script>
<script src="./include/js/login.js"></script>
<script src="./include/js/supersized.3.2.7.min.js"></script>
<script src="./include/js/supersized-init.js"></script>
<script src="./include/js/scripts.js"></script>
<script>
var pageN=1,pageTotal=100;
$(function(){
$.ajax({
	url:"./getCountNews",
	type:"post",
	success: function(res){
	pageTotal=res.newscount;
	listNews(1,10);loadPager();
},
error:function(res){
	$.messager.alert("系统提示","系统错误!","error");}
});
$("#llogin").hide();
$("#a").click(function(){
	$("#llogin").show();
	$("#lnews").hide();
});
$("#b").click(function(){
$("#llogin").hide();
$("#lnews").show();
});
});
function listNews(pageNumber, pageSize) {
	$
			.ajax({
				url : "./listNews",
				data : {
					"page" : pageNumber,
					"rows" : pageSize
				},
				type : "post",
				success : function(res) {
					$(".inews").remove();
					// res=JSON.parse(res);
					if (res.total <= 0) {
						var tr = "<tr class='inews' height=\"25\"><td >";
						tr += "<div class='t'>暂无相关新闻</div>";
						tr += "</td><td width='1%' nowrap=''><span >&nbsp;</span></td></tr>";
						$("#trpp").before(tr);
					} else {
						pageN = pageNumber;
						pageTotal = res.total;
						var rows = res.rows;
						for (var i = 0; i < rows.length;) {
							var row = rows[i];
							var tr = "<tr class='inews' height=\"25\"><td >";
							tr += "<div class='t'><a href='./getNews?id="
									+ row.id + "'target='_blank'>"
									+ cutstr(row.title, 29) + "</a></div>";
							tr += "</td><td width='1%' nowrap=''><span >"
									+ row.tjdate.substr(0, 10)
									+ "&nbsp;</span></td></tr>";
							$("#trpp").before(tr);
							i++;
							if (i % 5 == 0) {
								tr = "<tr class='inews' height='1'><td colspan='2' align='center'>";
								tr += "<hr style='border-style:dashed;border-color:#999999;width:99%;height:1px;border-width:1px 0px 0px0px;visibility:inherit'></td></tr>";
								$("#trpp").before(tr);
							}
						}
					}
				},
				error : function(res) {
					parent.dlg_ok(300, 140, "系统提示", "系统错误", null, "error");
				}
			})
}
function loadPager(){
	$('#pp').pagination({
	total:pageTotal,
	pageSize:10,
	pageNumber:pageN,
	displayMsg:'{from}/{to} 共{total}条',
	onSelectPage:function(pageNumber, pageSize){
	listNews(pageNumber,pageSize);
		}
	});
}
</script>

</body>


</html>


