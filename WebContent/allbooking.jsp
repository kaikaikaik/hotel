<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="com.icss.vo.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=0.95, user-scalable=no" />
<title>黄山醉温泉 - 会员中心</title>
<meta name="description" content="说明" />
<meta name="keywords" content="关键字" />
<link rel="stylesheet" href="css/user.css" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function goToOnePage() {
		var pageNum = document.getElementById("pageNum").value;
		if (pageNum == "") {
			window.location.href = "#";
		}
		else if (isNaN(pageNum)) {
			alert("请输入数字！");
		}
		else {
			window.location.href = "selectOrdersByUser_Phone.action?pageNum=" + pageNum;
		}
	}
</script>
</head>
<body>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/";
%>
	<!--头-->
	<div class="top">
		<div class="header clearfix">
			<div class="header_l">
				<a href="load.jsp"><img src="images/userlogo.png" /></a>
				<h2>会员中心</h2>
			</div>

			<div class="header_r">
<div class="img_link" id="login_after">
欢迎您：<i> ${sessionScope.nickname}</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="LogOffServlet">[退出登录]</a>
</div>
</div>

			<div class="clears"></div>
		</div>
	</div>
	<!--头-->
	<div class="clears"></div>


	<!--导航-->
	<!--会员中心-->
	<div class="member_center_wrap">
		<div class="member_center">
			<div class="member_center_l">
				<div class="body_center_main_tree">
					<ul>
						<li><dl>
								<dt>
									<a href="" class="cur">会员信息</a>
								</dt>
							</dl></li>
						<li><dl>
								<dt>
									<a href="">订单管理</a>
								</dt>
								<dd>
									<a href="BookListServlet?uid=${sessionScope.id}">全部订单</a> 
								</dd>
							</dl></li>
					</ul>
				</div>
			</div>
			<div class="member_center_r">
				<div class="center_main1">
					<div class="center_main_tab1">
						<span>订单管理</span>
					</div>

					<div class="dd_forms">
						<h2>订单信息</h2>
						
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table2" style="margin-bottom: 10px;">
								<tr class="tr1">
									<td>订单号</td>
									<td>入住时间</td>
									<td>离店时间</td>
									<td>姓 名</td>
									<td>价 格(一天)</td>
								</tr>
								 <%ArrayList<HotelConUser> list = (ArrayList<HotelConUser>)request.getAttribute("list");
								 for(HotelConUser xx:list){%>
								<tr class="tr4">
									<td><%=xx.getId() %></td>
									<td><%=xx.getStart1() %></td>
									<td><%=xx.getEnd1()%></td>
									<td><%=xx.getUser().getName() %></td>
									<td><%=xx.getHotel().getMoney()%></td>
								</tr>
								<%} %>
							</table>
							
						
					</div>
					<script type="text/javascript">
						formValidate({
							actOnCla : '.valid_ipt', //作用于什么选择器上 推荐标签：输入框input 下拉框select 文本区域textarea
							isStartVali : false, //是否页面加载后立即验证一次
							subBtn : '#sub_btn', //提交按钮，可以是a标签
							subBtn_gray : false, //提交后按钮是否进入等待状态
							subBtn_gray_img : 'img/wait_ico.gif', //按钮等待状态图标（如果是空文本则不加图标）
							other_valiFunc : function() {
								//其他验证条件 加入非表单验证的其他布尔函数。比如日期。如果表单提交超过指定日期，也是不能提交的！
								//两个条件都必须满足的话可以：  return dateJudge()&&dateJudge1();
								//return yes_rule();
							},
							success_func : function() {
								//通过验证后执行
								//location.href="注册提示.html";
								prompt_frm('修改成功', 1, 3000);
							}
						});

						//表单的其他验证方法
						//验证密码方法
						function ensure_pass(id) {
							var cla = $('#' + id);
							if (cla.val() == $('#pass').val()) {
								return true;
							}
							else
								return false;
						}

						//其他验证条件 加入非表单验证的其他布尔函数。比如日期。如果表单提交超过指定日期，也是不能提交的！

						$('.valid_ipt').focus(function() {
							$(this).parent().parent().find('.s3').hide();
						})
					</script>
				</div>
			</div>
		</div>
	</div>


	<!---尾部-->
	<div class="footer">
		<div class="link">
			<div class="copyright">Copyright &copy; 2014 黄山 &middot; 醉温泉 All Rights Reserved. 版权所有&nbsp;&nbsp;&nbsp;&nbsp;皖ICP备11009137号</div>
		</div>
	</div>
</body>
</html>