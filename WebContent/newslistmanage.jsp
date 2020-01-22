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
        <li class="click"><span><a href="addnews.jsp"><img src="images/t01.png"/></a></span><a href="addnews.jsp" class="click">增加</a></li>
        </ul>
    </div>
	<table>
			<tr style="text-align:center;">
				<td>新闻标题</td>
				<td>新闻描述</td>
				<td>新闻来源</td>
				<td>发布时间</td>
				<td>操作</td>
			</tr>
			<c:forEach var="pack" items="${NewsList}">
				<tr>
					<td style="text-align:center;">${pack.title}<br><img src="${pack.img}" alt="" style="width:300px; height:200px;"/></td>
					<td width=550px;>${pack.info}</td>
					<td>${pack.from1}</td>
					<td width=100px;>${pack.time}</td>
					<td>
						<div class="tools">
    						<ul class="toolbar">
        					<li><span><a href="UpdateNewsSelectServlet?id=${pack.id}"><img src="images/t02.png" /></a></span>
        							  <a href="UpdateNewsSelectServlet?id=${pack.id}">修改</a></li>
        					<li><span><a href="DeleteNewsServlet?id=${pack.id}"><img src="images/t03.png" /></a></span>
        							  <a href="DeleteNewsServlet?id=${pack.id}">删除</a></li>
        					</ul>
    					</div>
					</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>