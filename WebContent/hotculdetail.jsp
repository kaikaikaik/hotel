<%@page import="com.icss.vo.HotCulture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>黄山醉温泉</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
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


	<!--BIG PIC-->
	<div class="banners">&nbsp;</div>
	<!--BIG PIC-->


	<!--CONTENT-->
	<div class="content">
	<div class="mar1000 clearfix">
    	
        
		<div class="lefts">
        	<div class="tree">
            	<label>温泉文化</label>
                <a href="HotCultureListServlet?current=1" class="hover">温泉文化</a>
            </div>
        </div>
      	<div class="rights">
        	<div class="path path_nomar"><label>温泉文化</label><span>当前位置：首页 &gt; 温泉文化</span></div>
            <%HotCulture hotCulture = (HotCulture)request.getAttribute("hc"); %>
            <div class="conten">
             <h1><%=hotCulture.getTitle() %></h1>
	            <table width="700" border="0" align="center" cellpadding="0" cellspacing="0" style="border-top:1px #685745 dotted;border-bottom:1px #685745 dotted;">
	              	<tbody>
	              		<tr>
	                		<td height="30" align="center">来源：<%=hotCulture.getFrom1()%> 发布时间：<%=hotCulture.getTime()%></td>
	              		</tr>
	            	</tbody>
	            </table>
            <div class="contents">
             <p align="center"></p>
						<table width="700" border="0" align="center" cellpadding="10"
							cellspacing="0">
							<tr>
								<td style="line-height: 25px;">
								<div style="margin: 0 auto;width:500px"><img src="<%=hotCulture.getImg()%>" style="width:500px;height:300px"></div>
								<div><%=hotCulture.getInfo()%></div>
								</td>
							</tr>
						</table>

					</div>
        </div>
        </div>
        
    </div>
</div>
	<!--CONTENT-->


	<!--FOOTER-->
	
	<div class="footer">
		地址：黄山市屯溪区花山路新徽天地醉温泉国际度假城&nbsp;&nbsp;&nbsp;&nbsp;邮编:236010<br />
		电话：0559-2536999&nbsp;&nbsp;2568666&nbsp;&nbsp;&nbsp;&nbsp;免费预订电话：400-0559-700<br />
		Copyright &copy; 2003-2014 黄山 &middot; 醉温泉&nbsp;&nbsp;All rights
		reserved.&nbsp;&nbsp;皖ICP备11009137号
	</div>
	<!--FOOTER-->
</body>
</html>