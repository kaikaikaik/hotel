<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/login.css" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>

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
<li><dl><dt><a href="" class="cur">会员信息</a></dt>
</dl>
</li>
<li><dl><dt><a href="">订单管理</a></dt>
<dd>
<a href="BookListServlet?uid=${sessionScope.id}">全部订单</a>
</dd>
</dl>
</li>
<!-- <li><dl><dt><a href="">个人管理</a></dt>
<dd><a href="个人资料管理.html">个人资料管理</a>
<a href="修改密码.html">修改密码</a>
</dd>
</dl>
</li> -->

</ul>
</div>
</div>
<div class="member_center_r">
<div class="center_main1">
<div class="center_main_tab1">
<span>个人中心</span>
</div>

           
		
<!--
给要验证的表单元素加上验证class，这里是valid_ipt
属性说明：
focusText						当焦点在此表单元素上显示的内容 为空或没有此参数则不会出现
errorText						当正则判断错误后显示的内容 为空或没有此参数则不会出现
emptyText						当没有输入任何内容时显示的内容 为空或没有此参数则不会出现
regexp							正则表达式。不加则无正则要求。默认的正则类型详见LxcFormValidate.js，如果自定义 regexp = "define:你的正则"
length							定义输入内容的长度。不加则不判断长度。有三种形式  4 表示只能有4个字符  4- 表示4个或4个以上的字符  4-6 表示4到6个字符
other_valiFun					如果有其他验证表单元素的函数可加在此处。可以获取本表单元素的ID来传入到你的验证函数。
other_valiFunText				你定义的其他验证函数如果返回false，则显示的错误信息 为空或没有此参数则不会出现
noMust							不是必填项则设为true。但还是要验证此元素的正则。
-->
<script type="text/javascript">
formValidate({
	actOnCla:'.valid_ipt',						//作用于什么选择器上 推荐标签：输入框input 下拉框select 文本区域textarea
	isStartVali:false,							//是否页面加载后立即验证一次
	subBtn:'#sub_btn',							//提交按钮，可以是a标签
	subBtn_gray:false,							//提交后按钮是否进入等待状态
	subBtn_gray_img:'img/wait_ico.gif',			//按钮等待状态图标（如果是空文本则不加图标）
	other_valiFunc:function(){
		//其他验证条件 加入非表单验证的其他布尔函数。比如日期。如果表单提交超过指定日期，也是不能提交的！
		//两个条件都必须满足的话可以：  return dateJudge()&&dateJudge1();
		//return yes_rule();
	},				
	success_func:function(){
		//通过验证后执行
		//location.href="注册提示.html";
		prompt_frm('修改成功',1,3000);
	}
});

//表单的其他验证方法
//验证密码方法
function ensure_pass(id){
	var cla = $('#'+id);
	if(cla.val()==$('#pass').val()){
		return true;
	} else return false;
}

//其他验证条件 加入非表单验证的其他布尔函数。比如日期。如果表单提交超过指定日期，也是不能提交的！

$('.valid_ipt').focus(function(){
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
    	<div class="copyright">
Copyright &copy; 2014 黄山 &middot; 醉温泉 All Rights Reserved. 版权所有&nbsp;&nbsp;&nbsp;&nbsp;皖ICP备11009137号 
    </div>
  </div>
    
</div>
</body>
</html>