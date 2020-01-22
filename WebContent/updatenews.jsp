<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.icss.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%NewsList nl = (NewsList)request.getAttribute("updatenews"); %>
	<form action="UpdateNewsServlet?id=<%=nl.getId()%>" method="post">
		<table>
			<tr>
				<td>折扣标题:<input type="text" name="title" style="width:260px;" value="<%=nl.getTitle()%>"></td>
			</tr>
			<tr>
				<td>折扣来源:<input type="text" name="from1" value="<%=nl.getFrom1()%>"></td>
			</tr>
			<tr>
				<td>相关描述:</td>
			</tr>
			<tr>
				<td><textarea rows="7" cols="100" name="info"><%=nl.getInfo()%></textarea></td>
			</tr>
			<tr>
				<td>图片信息:</td>
			</tr>
			<tr>
				<td><img src="<%=nl.getImg() %>" name="img" style="width:300px; height:200px;"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="path"/>
					<input type="file" name="imgUpload" onchange=getPath()>
				</td>
			</tr>
			<tr>
				<td>修改时间:<input type="text" name="time" value="<%=nl.getTime()%>"></td>
			</tr>
			<tr>
				<td style="float:right"><input type="submit" value="修改"></td>
			</tr>
		</table>
	</form>
</body>
</html>