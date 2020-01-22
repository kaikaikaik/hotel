<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${title}<br>
	${from}<br>
	${info}<br>
	${time}<br>
	${msg}<br>
	${date}<br>
	<form action="AddSaleListServlet" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>折扣标题:<input type="text" name="title" ></td>
			</tr>
			<tr>
				<td>折扣来源:<input type="text" name="from1"></td>
			</tr>
			<tr>
				<td>相关描述:</td>
			</tr>
			<tr>
				<td><textarea rows="7" cols="100" name="info"></textarea></td>
			</tr>
			<tr>
				<td>图片信息:</td>
			</tr>
			<tr>
				<td><img src="" name="img" style="width:300px; height:200px;"></td>
			</tr>
			<tr>
				<td><input type="file" name="uploadFile">
				</td>
			</tr>
			<tr>
				<td>修改时间:<input type="text" name="time"/><b>时间格式为XXXX-XX-XX</b></td>
			</tr>
			<tr>
				<td style="float:right"><input type="submit" value="增加"></td>
			</tr>
		</table>
	</form>
</body>
</html>