<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>好玩儿的二维码</title>
<meta name="description" content="说明" />
<meta name="keywords" content="关键字" />
<link rel="stylesheet" href="css/login.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<style type="text/css">
#code {
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 2px;
	color: blue;
}
</style>
</head>
<body>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/";
%>
	<!--HEADER-->
	<div class="header" id="header">
		<div class="mar1000 clearfix">
			<div class="logo"></div>
			<div class="header_right">
			<div class="homeinfo">
					<label><span>免费预订电话：<strong>400-0559-700</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;|</label> 
					
					<c:if test="${sessionScope.nickname == null }">
					<label><a href="login.jsp">会员登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;|
					</label> 
					</c:if>
					<c:if test="${sessionScope.nickname != null }">
					<span style="color:#f00">用户昵称：   ${sessionScope.nickname}</span>
					 <img src = "${basePath}${sessionScope.img}" style="width:50px;height:50px">
					  <a href="LogOffServlet">退出登录</a>
					</c:if>
				</div>
				<div class="nav">
					<a href="LoadServlet" class="hover">首 页</a> 
					<a href="reservehotel.jsp">酒店预定</a> 
					<a href="NewsListServlet?current=1">酒店新闻</a> 
					<a href="PackageListServlet?current=1">促销活动</a> 
					<a href="HotCultureListServlet?current=1">温泉文化</a> 
					<a href="qrcode.jsp">二维码</a> 
				<c:if test="${sessionScope.nickname != null }">
					<a href="personal.jsp">个人中心</a>
				</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--HEADER-->

	<!--身-->
	<div class="container_wrap">
		<div class="container">
			<!--左-->
			<div class="container_l">
			
				<h1>好玩儿的二维码</h1>
				<form action="QRServlet" method="post">
				<div class="form_list">
					<ul>
						<li class="clearfix">
        <br> <span class="s1">请输入网址:</span> <span class="s2">
						<input type="text" class="valid_ipt" name="path" value="http://"/></span><span style="color:red">*输入网址后自动生成该网址的二维码</span></li>
						<br>
						<%String name = (String)request.getAttribute("pathImg");
						if(!("").equals(name)){%>
							<img src = "${basePath}${pathImg}">
						<% }
						%>
						<div class="btn_area clearfix">
						<input type="submit" id="sub_btn" class="btn1" value="生 成">
					</div>
					</ul>
				</div>
				</form>
			</div>

		</div>
	</div>
	<!--尾部-->
	<div class="footer">Copyright &copy; 2014 黄山 &middot; 醉温泉 All Rights Reserved. 版权所有&nbsp;&nbsp;&nbsp;&nbsp;皖ICP备11009137号</div>

</body>
</html>