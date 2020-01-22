<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="AddUserServlet" method="post">
		用户名称:<input type="text" name="name"><br> 
		用户密码:<input type="password" name="password"><br> 
		用户邮箱:<input type="text" name="email"><br>
		用户昵称:<input type="text" name="nickname"><br>
		用户密保:<input type="text" name="mibao"><br>
		用户头像:<input type="text" name="avatar"><br>
		<input type="submit" value="增加">
	</form>
</body>
</html>