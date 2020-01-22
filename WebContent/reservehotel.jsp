<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" import="com.icss.vo.*"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>黄山醉温泉</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function checkNull(){
		var time1 = document.getElementById("getTime1").value
		var time2 = document.getElementById("getTime2").value
		if(time1!=null&&time1!=""&&time2!=null&&time2!=""){
			timeForm.action="HotelListServlet";
			timeForm.submit();
		}else{
			alert("请选择正确的日期，不能为空！");
		}
	}
</script>
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
<div class="banners">
&nbsp;
</div>
<!--BIG PIC-->


<!--CONTENT-->
<div class="content">
	<div class="mar1000 clearfix">
    	
        
		<div class="lefts">
        	<div class="tree">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td><img src="images/nei_3.jpg" width="233" height="92"></td>
							</tr>
						</tbody>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="217" valign="top" background="images/nei_4.jpg"><table
										width="160" border="0" align="right" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td height="25">地址：黄山市屯溪区花山路</td>
											</tr>
											<tr>
												<td height="25">黄山醉温泉度假城</td>
											</tr>
											<tr>
												<td height="25">贵宾专线：0559-2536999</td>
											</tr>
											<tr>
												<td height="25">0559-2568666</td>
											</tr>
											<tr>
												<td height="25">业务传真：0559-2333501</td>
											</tr>
											<tr>
												<td height="25">邮件：info@hszwq.com</td>
											</tr>
											<tr>
												<td height="25">网址：www.hszwq.com</td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
            </div>
        </div>
      <div class="rights">
      		
            <div class="path path_nomar"><label>酒店预订</label><span>当前位置：首页 &gt; 酒店预订</span></div>
            
            <!--查询功能-->
            <form action="HotelListServlet" method="post" id="timeForm">
            <div class="search">入住日期：<input type="text" class="input01s" onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'getTime2\',{d:-1})}',errDealMode:1})" name="arrive" id="getTime1">&nbsp;&nbsp;退房日期：<input type="text" class="input01s" onclick="WdatePicker({minDate:'#F{$dp.$D(\'getTime1\',{d:1})||$dp.$DV(\'%y-%M-%d\',{d:1})}',errDealMode:1})" name="leave" id="getTime2">&nbsp;&nbsp;<input type="button" value="开始查询" onclick="checkNull()" class="btn01s"></div>
            </form>
            <!--查询功能-->
           ${msg }
			<!--搜索结果-->
			 <%String arrive = (String)request.getAttribute("arrive"); 
			 if(arrive != null){%>
            <div class="home_search_jg">
            <strong>预订条件：</strong>&nbsp;&nbsp;&nbsp;&nbsp;入住日期：<b>${arrive}</b>&nbsp;&nbsp;&nbsp;&nbsp;退房日期 ：<b>${leave}</b>
            </div>
            <%} %>
            
            <!--客房预订-->
            <%ArrayList<Hotel> hotels = (ArrayList<Hotel>)request.getAttribute("hotels");
            if(hotels != null){
            %>
            <div class="home_list">
                <!--单元-->
                 <c:forEach var="hotels" items="${hotels}">
                <div class="dd_list">
                <h3>${hotels.name}</h3>
                <p>${hotels.info}</p>
                <div class="dd_list_h">
                    <img src="${hotels.img}" width="180" height="118" />
                    <div class="dd_list_house">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table01">
                          <tr class="p">
                            <td width="41%">价格名称</td>
                            <td width="15%">平均房价</td>
                            <td width="15%">早餐</td>
                            <td width="15%">支付方式</td>
                            <td width="14%">&nbsp;</td>
                          </tr>
                          <tr class="o">
                            <td>${hotels.name}</td>
                            <td>¥${hotels.money} </td>
                            <td>${hotels.food}</td>
                            <td>${hotels.pay}</td>
                            <td>
                            <c:if test="${sessionScope.nickname != null }">
<a href="BookingHotelServlet?uid=${sessionScope.id}&hid=${hotels.id}&start1=${arrive}&end1=${leave}" class="yd">预订</a>
							</c:if>
							<c:if test="${sessionScope.nickname == null }">
							还没有登录不能预订
							</c:if>
                            </td>
                          </tr>
                        
                        </table>
                    </div>
                    <div class="clears"></div>
                </div>
                </div>     
                </c:forEach>                      
        </div>
            <%}%>
           <span style="color:red;">${hmsg }</span> 
        </div>
    </div>
</div>
<!--CONTENT-->


<!--FOOTER-->

<div class="footer">
地址：黄山市屯溪区花山路新徽天地醉温泉国际度假城&nbsp;&nbsp;&nbsp;&nbsp;邮编:236010<br/>
电话：0559-2536999&nbsp;&nbsp;2568666&nbsp;&nbsp;&nbsp;&nbsp;免费预订电话：400-0559-700<br/>
Copyright &copy; 2003-2014  黄山 &middot; 醉温泉&nbsp;&nbsp;All rights reserved.&nbsp;&nbsp;皖ICP备11009137号
</div>
<!--FOOTER-->
	
</body>
</html>