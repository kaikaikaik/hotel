<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="tools">
    	<ul class="toolbar">
        <li class="click"><span><a href="adduser.jsp"><img src="images/t01.png"/></a></span><a href="adduser.jsp" class="click">增加</a></li>
        </ul>
    </div>
	<table>
			<tr style="text-align:center;">
				<td>姓名</td>
				<td>密码</td>
				<td>昵称</td>
				<td>邮箱</td>
				<td>密保</td>
				<td>操作</td>
			</tr>
			<c:forEach var="pack" items="${nima}">
				<tr>
					<td style="text-align:center;">${pack.name}<br><img src="${pack.avatar}" alt="" style="width:300px; height:200px;"/></td>
					<td width=470px;>${pack.password}</td>
					<td>${pack.nickname}</td>
					<td>${pack.email}</td>
					<td>${pack.mibao}</td>
					<td>
						<div class="tools">
    						<ul class="toolbar">
        					<li><span><a href="UpDateSelectUserServlet?id=${pack.id}"><img src="images/t02.png" /></a></span>
        							  <a href="UpDateSelectUserServlet?id=${pack.id}">修改</a></li>
        					<li><span><a href="DeleteUserServlet?id=${pack.id}"><img src="images/t03.png" /></a></span>
        							  <a href="DeleteUserServlet?id=${pack.id}">删除</a></li>
        					</ul>
    					</div>
					</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>