<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>订单亿管理系统</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script type="java/script">

</script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="head-l">
			<h1>
				<img src="images/x.png" class="radius-circle rotate-hover"
					height="50" alt="" />订单亿
			</h1>
		</div>
		<div class="head-l" style="float: right;">
			用戶名：${admin.adminName}
			<!-- <a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> åå°é¦é¡µ</a> -->
			&nbsp;&nbsp;<a href="updatePwd.jsp" class="button button-little bg-blue"><span
				class="icon-wrench"></span>修改密码</a> &nbsp;&nbsp;<a
				class="button button-little bg-red" href="logout.do">
				<span class="icon-power-off">退出</span></a>
		</div>
	</div>
	<div class="leftnav">
		<h2>
			<span class="icon-pencil-square-o"></span><a href="searchProduct.do" target="right">产品管理</a>
		</h2>
		
		<h2>
			<span class="icon-pencil-square-o"></span>订单管理
		</h2>
		<ul>
		<li><a href="searchOrder.do" target="right"><span
					class="icon-caret-right"></span>订单查询</a></li>
			<li><a href="searchCheckOrder.do" target="right"><span
					class="icon-caret-right"></span>待审核</a></li>
			<li><a href="searchPayOrder.do" target="right"><span
					class="icon-caret-right"></span>待付款</a></li>
			<li><a href="searchSendOrder.do" target="right"><span
					class="icon-caret-right"></span>待发货</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span><a href="searchEnterprise.do" target="right">经销商管理</a>
		</h2>
		<h2>
			<span class="icon-pencil-square-o"></span><a href="searchMessage.do" target="right">信息发布</a>
		</h2>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2:eq(1)").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})

		});
	</script>
	<ul class="bread">
		<li><a href="{:U('Index/info')}" target="right" class="icon-home">
				首页</a></li>
		<li><a href="##" id="a_leader_txt">网站信息</a></li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="info.html" name="right"
			width="100%" height="100%"></iframe>
	</div>

	<div style="text-align: center;">
		<p>
			来源:<a href="#" target="_blank">zhujisong</a>
		</p>
	</div>
</body>
</html>