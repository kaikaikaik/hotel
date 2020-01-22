<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>黄山醉温泉</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<style type="text/css">
/*侧边栏*/
.hide {
	display: none
}

.side_bar {
	position: fixed;
	left: 50%;
	margin-left: 610px;
	bottom: 20px;
	width: 48px;
	z-index: 10000;
}

.side_bar li {
	margin: 3px 0;
}

.side_bar a {
	display: inline-block;
	padding: 10px 12px;
	line-height: 14px;
	color: #FFF;
}

.side_bar a:hover {
	color: #000000;
}
</style>
<script>
	$(window).scroll(function() {
		var scroll_len = $(window).scrollTop();
		if (scroll_len > 10) {
			$('.side_bar').fadeIn();
		}
		else {
			$('.side_bar').fadeOut();
		}
		;
	});
</script>
<!--[if IE 6]><script type="text/javascript" src="js/DD_belatedPNG.js"></script>
<script type="text/javascript">
    window.onload = function(){
        DD_belatedPNG.fix("img, div, a");
    }
</script>
<![endif]-->
<!--[if lt IE 9]>
   <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript">
var xhr;
window.onload = init();
//创建XMLHttpRequest对象
function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	}
}
function init(){
	//创建xmlHttp对象
	createXMLHttpRequest();
	var dsq = window.setInterval("ajax_requset()", 1000);}
		function ajax_requset(){			 
			var cf = document.getElementById("cf").value;//0
			xhr.open('get','TuiSongServlet?cf='+cf);			
			xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 ){
					if(xhr.status==200){
						var msg = xhr.responseText;
						if(msg!=null && msg != ""){
							var text = msg.split("#");
							document.getElementById("cf").value=text[0];		
							alert(text[1]);
						}
					}
				}
			}
			xhr.send();
		}
</script>
</head>
<body>
<%
int cf;
	if((String)application.getAttribute("flag")== null||"" ==(String)application.getAttribute("flag")){
		cf = 0;
	}else{
		cf = Integer.parseInt((String)application.getAttribute("flag")); 
	}
%>
<input type="hidden" value="<%=cf %>" id="cf">
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<div id="d1"></div>
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


	<!--BIG PIC-->
	<div class="banner">
		<div class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li><div class="img bg1">&nbsp;</div></li>
					<li><div class="img bg2">&nbsp;</div></li>
					<li><div class="img bg3">&nbsp;</div></li>
				</ul>
			</div>
		</div>
		<div class="clears"></div>
		<script defer src="js/slider.js"></script>
		<script type="text/javascript">
			$(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
	</div>
	<!--BIG PIC-->


	<!--CONTENT-->
	<div class="content" id="cxhd">
		<div class="mar1000 clearfix">
			<!--优惠信息-->
			<div class="discount">
				<div class="d_title title01">
					<a href="PackageListServlet?current=1">更多优惠</a>
				</div>
				<div class="discount-list clearfix">
					<ul>
						<c:forEach var="pack" items="${packageList}">
							<li class="nor">
								<div class="discount-itembg h300"></div>
								<div class="discount-item">
									<a href="PackageDetailServlet?id=${pack.id}"> <img src="${pack.img}" alt="" /></a>
									<h3 style="margin-left: 50px">
										<a href="PackageDetailServlet?id=${pack.id}">${pack.title}</a>
									</h3>
									<p>${pack.info}</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="clears"></div>
			</div>
			<!--视频及新闻-->
			<div class="v-news clearfix" id="jdxw">
				<div class="news right">
					<div class="d_title title03">
						<a href="NewsListServlet?current=1">更多</a>
					</div>
					<div class="news-lay">
						<div class="newsbg"></div>

						<div class="news-item">
							<%
								int index = 0;
							%>
							<c:forEach var="news" items="${newsList}">
								<%
									index++;
										if (index == 1) {
								%>
								<img src="${news.img}"/>
								<div class="hot_news">
									<h2>
										<a href="NewsDetailServlet?id=${news.id}">${news.title}</a>
									</h2>
									<p>
										${news.info}<a href="NewsDetailServlet?id=${news.id}">[点击详细]</a>
									</p>
								</div>
								<%
									} else {
								%>
								<ul>
									<li style="height: 10px; float: left; width: 450px"><span style="height: 20px; float: right">${news.time}</span> <a
										href="NewsDetailServlet?id=${news.id}">${news.title}</a></li>
								</ul>
								<%
									}
								%>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="video left">
					<div class="d_title title02"></div>
					<div class="video-lay">
						<!-- <div class="videobg"></div> -->
						<div class="video-item">
							<!-- <img src="images/v1.jpg" alt=""/> -->
							<video id="myVideo" src="images/wenquan.mp4" controls loop width="476" height="300"></video>
						</div>
					</div>
				</div>
			</div>
			<div class="clears"></div>
			<div class="H50" id="wenquan"></div>
			<%
				int index1 = 0;
			%>
			<c:forEach var="infos" items="${infoList}">
				<%
					index1++;
						if (index1 == 1) {
				%>
				<!--介绍1-->
				<div class="phone clearfix">
					<!--醉左-->
					<div class="pic_title01 pict01"></div>
					<div class="phones">
						<div class="pic01"></div>
						<div class="smbg"></div>
						<div class="picfont">
							<a href="IndexInfoDetailServlet?id=${infos.id}"></a>
							<p>${infos.info}</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<%
					if (index1 == 2) {
				%>
				<!--介绍2-->
				<div class="phone clearfix">
					<!--醉左-->
					<div class="pic_title02 pict02"></div>
					<div class="phones">
						<div class="pic02"></div>
						<div class="smbg"></div>
						<div class="picfont">
							<a href="IndexInfoDetailServlet?id=${infos.id}"></a>
							<p>${infos.info}</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<%
					if (index1 == 3) {
				%>
				<!--介绍3-->
				<div class="phone clearfix">
					<!--醉左-->
					<div class="pic_title01 pict03"></div>
					<div class="phones">
						<div class="pic03"></div>
						<div class="smbg"></div>
						<div class="picfont">
							<a href="IndexInfoDetailServlet?id=${infos.id}"></a>
							<p>${infos.info}</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</c:forEach>

		</div>


	</div>
	<!--CONTENT-->


	<!--FOOTER-->

	<div class="footer">
		地址：黄山市屯溪区花山路新徽天地醉温泉国际度假城&nbsp;&nbsp;&nbsp;&nbsp;邮编:236010<br />
		电话：0559-2536999&nbsp;&nbsp;2568666&nbsp;&nbsp;&nbsp;&nbsp;免费预订电话：400-0559-700<br /> Copyright &copy; 2003-2014 黄山 &middot;
		醉温泉&nbsp;&nbsp;All rights reserved.&nbsp;&nbsp;皖ICP备11009137号
	</div>
	<!--FOOTER-->



	<!--侧边栏-->
	<!--侧边漂浮边栏-->
	<div class="side_bar hide">
		<ul>
			<li><a href="reservehotel.jsp" style="background-color: #5D9820;">酒店预定</a></li>
			<li><a href="#jdxw" style="background-color: #aE8B63;">酒店新闻</a></li>
			<li><a href="#cxhd" style="background-color: #cb3fd4;">促销活动</a></li>
			<li><a href="#wenquan" style="background-color: #e62469;">温泉文化</a></li>
			<li><a href="#header" style="background-color: #ff6600;">回到首部</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		pos();
	</script>
	
	
</body>
</html>