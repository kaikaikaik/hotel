
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>新用户注册</title>
<meta name="description" content="说明" />
<meta name="keywords" content="关键字" />
<link rel="stylesheet" href="css/login.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var flag = 1;
	var xmlHttp;
	//创建XMLHttpRequest对象
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function validate() {
		//创建xmlHttp对象
		createXMLHttpRequest();
		//使用DOM，得到id值是username的域
		var username = document.getElementById("username");
		var url = "ValidateUsernameServlet?username=" + escape(username.value);
		//向服务器端的    ValidateUsernameServlet发送异步请求
		xmlHttp.open("GET", url, true);
		//当状态有变化的时候，调用callback方法
		xmlHttp.onreadystatechange = callback;
		xmlHttp.send(null);
	}

	function callback() {
		//当客户端完全接收完服务器的响应后，并且状态为200，也就是正常
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				//使用responseXML属性，接收服务器端返回的的XML文件 ，使用DOM解析XML         
				var message = xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
				if("用户名已存在，请选择使用其他用户名" == message){
					document.getElementById("sub_btn").disabled = true;
				}else{
					document.getElementById("sub_btn").disabled = false;
				}
				var passed = xmlHttp.responseXML.getElementsByTagName("passed")[0].firstChild.data;
				setMessage(message, passed);
			}
		}
	}
	function setMessage(message, passed) {
		//使用DOM得到id值为usernamemsg的域，用来显示提示信息    
		var validateMessage = document.getElementById("usernamemsg");
		var fontColor = "red";
		if (passed == "true") {
			fontColor = "green";
		}
		validateMessage.innerHTML = "<font color=" + fontColor + ">" + message + " </font>";
	}
	function reg() {
		formSubmit();
	}
	var progress;
	var uploadProcessTimer = null;

	function formSubmit() {
		uploadProcessTimer = window.setInterval("getFileUploadProcess()", 1000);//每隔100毫秒执行callback  
		document.forms[0].submit();
	}
	function getFileUploadProcess() {
		$.ajax({
			type : "GET",
			url : "FileUploadStatusServlet",
			dataType : "text",
			cache : false,
			success : function(data) {
				if (data == "100%") {
					window.clearInterval(uploadProcessTimer);
				}
				else {
					progress = data;
					$("#show").width(data);
					$("#msg").text(data);
				}
			}
		});
	};
</script>
</head>
<body>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<!--HEADER-->
	<div class="header" id="header">
		<div class="mar1000 clearfix">
			<div class="logo"></div>
			<div class="header_right">
				<div class="homeinfo">
					<label><span>免费预订电话：<strong>400-0559-700</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;|</label>
					<c:if test="${sessionScope.nickname == null }">
						<label><a href="login.jsp">会员登录</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;| </label>
					</c:if>
					<c:if test="${sessionScope.nickname != null }">
						<span style="color: #f00">用户昵称： ${sessionScope.nickname}</span>
						<img src="<%=basePath %>${sessionScope.img}" style="width: 50px; height: 50px">
						<a href="LogOffServlet">退出登录</a>
					</c:if>
				</div>
				<div class="nav">
					<a href="LoadServlet" class="hover">首 页</a> <a href="reservehotel.jsp">酒店预定</a> <a href="NewsListServlet?current=1">酒店新闻</a> <a
						href="PackageListServlet?current=1">促销活动</a> <a href="HotCultureListServlet?current=1">温泉文化</a> <a href="qrcode.jsp">二维码</a>
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
		<div class="container clearfix">
			<!--左-->
			<div class="container_l">
				<h1>新用户注册</h1>
				<div class="form_list">
					<form action="RegisterServlet" method="post" enctype="multipart/form-data">
						<ul>
							<%
								String token1 = (String) request.getAttribute("token1");
								if (token1 != null) {
							%>
							<script type="text/javascript">
								alert("不能重复提交数据,请重新注册用户");
							</script>
							<%
								}
							%>
							<li class="clearfix"><span class="s1">用户名</span> <span class="s2"> <input id="username" name="username" type="text"
									class="valid_ipt" onblur="validate()" value="${inputname }"/>
									<!-- 将随机值放入隐藏域 -->
							</span>
								<div id="usernamemsg">
									<i class="red" style="color: red">${username}</i>
								</div></li>
							<li class="clearfix"><span class="s1">密码:</span> <span class="s2"> <input type="password" class="valid_ipt"
									name="password" value="${inputpass }"/>
							</span> <span id="tishi"><i class="red" style="color: red">${password}</i></span></li>
							<li class="clearfix"><span class="s1">确认密码:</span> <span class="s2"><input id="ensure_pass" type="password"
									name="password1" class="valid_ipt" value="${inputrepass }"/> </span><span id="tishi2"> <i class="red" style="color: red">${reppass}</i></span></li>
							<li class="clearfix"><span class="s1">昵称:</span> <span class="s2"><input type="text" class="valid_ipt" id="nickchk"
									name="nickname" value="${inputnick }"/></span><span id="tishi3"> <i class="red" style="color: red">${nickname1}</i></span></li>
							<li class="clearfix">
							
							<span class="s1">电子邮箱:</span> <span class="s2"> 
							<input type="text" class="valid_ipt" id="email" 
							name="email" value="${inputemail }"/>
							<i class="red" style="color: red">${email}</i>
							</span> 
							
							<span class="s3"><i class="red">*</i> 用于找回密码。
							<font style="color:red">(请务必使用qq邮箱)</font> </span>
							
							<span id="tishi4" style="margin-left: 100px"> </span></li>
							<li class="clearfix"><span class="s1">密保一</span> 
							<span class="s2"><input type="text" class="valid_ipt" id="mibao" name="mibao" value="${inputmb}"/> 
									<%-- <i class="red" style="color: red">${mibao}</i></span> --%>
									
								</span>	
									 <span class="s3"> <i class="red">*</i> 请输入你父亲的名字
							</span><span id="tishi5" style="margin-left: 100px"> <i class="red" style="color: red">${mibao}</i></span></li>
							<li class="clearfix"><span class="s1">上传头像</span> <input type="file" id="file1" name="file" />
								<div style="width: 273px;">
									<div id="show" style="background: #0ff; height: 26px; width: 0%;"></div>
								</div> <span id="msg"></span>
						</ul>
						<div class="btn_area">
							<%
								//产出随机值 tokenval
								String tokenVal = new Date().getTime() + "";
								//将隐藏域放入session
								session.setAttribute("tokenval", tokenVal);
							%>
							<input type="hidden" name="token" value="<%=tokenVal%>" />
							<input type="submit" id="sub_btn" class="btn2" onclick="reg()" value="轻松注册" />
						</div>

					</form>
				</div>
			</div>
			<!--右-->
			<div class="container_r">
				<div class="ishave">
					<p>已经有帐号？请直接登录</p>
					<p class="p1">
						<a href="login.jsp" class="btn1">立即登录</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--尾部-->
	<div class="footer">Copyright &copy; 2014 黄山 &middot; 醉温泉 All Rights Reserved. 版权所有&nbsp;&nbsp;&nbsp;&nbsp;皖ICP备11009137号</div>

</body>
</html>