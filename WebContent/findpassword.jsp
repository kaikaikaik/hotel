<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>找回密码</title>
<script type="text/javascript">
	//设置一个全局的变量，便于保存验证码
	var code;
	function createCode() {
		//首先默认code为空字符串
		code = '';
		//设置长度，这里看需求，我这里设置了4
		var codeLength = 4;
		var codeV = document.getElementById('code');
		//设置随机字符
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		//循环codeLength 我设置的4就是循环4次
		for (var i = 0; i < codeLength; i++) {
			//设置随机数范围,这设置为0 ~ 36
			var index = Math.floor(Math.random() * 36);
			//字符串拼接 将每次随机的字符 进行拼接
			code += random[index];
		}
		//将拼接好的字符串赋值给展示的Value
		codeV.value = code;
	}

	//下面就是判断是否== 的代码，无需解释
	function validate() {
		var oValue = document.getElementById('input').value.toUpperCase();
		if (oValue == 0) {
			alert('请输入验证码');
		}
		else if (oValue != code) {
			alert('验证码不正确，请重新输入');
			oValue = ' ';
			createCode();
		}
		else {
			var flag = 1;
			var username = document.getElementById("username").value;
			var father = document.getElementById("father").value;
			var usernamemsg = document.getElementById("usernamemsg");
			var pwdmsg = document.getElementById("pwdmsg");
			if (username == null || username == "") {
				usernamemsg.innerHTML = "<font color='red'>用户名不能为空</font>";
				flag = 0;
			}else{
				usernamemsg.innerHTML = "";
			}
			if (father == null || father == "") {
				pwdmsg.innerHTML = "<font color='red'>密保不能为空</font>";
				flag = 0;
			}else{
				pwdmsg.innerHTML = "";
			}
			if (flag == 1) {
				form1.action = "FindPasswordServlet";
				form1.submit();
			} 
		}
	}

	//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
	window.onload = function() {
		createCode();
	}
</script>
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
					 <img src = "<%=basePath %>${sessionScope.img}" style="width:50px;height:50px">
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
			
				<h1>找回密码</h1>
				<form id="form1" name="form1" action="" method="post">
				<div class="form_list">
					<ul>
						<li class="clearfix">
						
						<%
		String msg=(String)request.getAttribute("msg");
         if(msg!=null&&!msg.equals("")) {%>
		<font color='red'>提示信息：<%=msg %></font>
		<%} %>
		
        <br> <span class="s1">用户名:</span> <span class="s2">
						<input type="text" class="valid_ipt" id="username" name="username" /></span> <span id="usernamemsg"></span></li>

						<li class="clearfix"><span class="s1">你父亲的名字</span> <span class="s2">
						<input type="text" class="valid_ipt" id="father" name="father" /> </span> <span id="pwdmsg"></span></li>

						<li class="clearfix"><span class="s1">验证码:</span> <span class="s2"><input id="input" type="text" class="valid_ipt" /> </span> <input
							type="button" id="code" onclick="createCode()" /></li>
					</ul>
		
					<div class="btn_area clearfix">
						<input type="button" id="sub_btn" class="btn1" onclick="validate()" value="找回">
					</div>
				</div>
				</form>
			</div>
			<!--右-->
			<div class="container_r">
				<div class="register_right">
					<h2>注册</h2>
					<div class="user_ishave">
						<p>还没有黄山 &middot; 醉温泉会员账号？</p>
						<p class="p1">
							<a href="register.jsp" class="btn2">轻松注册</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--尾部-->
	<div class="footer">Copyright &copy; 2014 黄山 &middot; 醉温泉 All Rights Reserved. 版权所有&nbsp;&nbsp;&nbsp;&nbsp;皖ICP备11009137号</div>

</body>
</html>