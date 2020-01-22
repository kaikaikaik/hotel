<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.icss.vo.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Users ut =(Users)request.getAttribute("yx");%>
<form action="UpDateUserServlet?id=<%=ut.getId()%>" method="post">
用户ID<%=ut.getId()%><br>
名称<input type="text" value ="<%=ut.getName() %>"name="name" ><br>
密码<input type="text" value ="<%=ut.getPassword() %>"name="password"><br>
邮箱<input type="text" value ="<%=ut.getEmail() %>"name="email"><br>
昵称<input type="text" value ="<%=ut.getNickname() %>"name="nickname"><br>
密保<input type="text" value ="<%=ut.getMibao() %>"name="mibao"><br>
头像<input type="text" value ="<%=ut.getAvatar() %>"name="avatar"><br>
<input type="submit" value="修改">
</form>
</body>
</html>