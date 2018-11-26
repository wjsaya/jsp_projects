<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>插入</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body align=center>
	插入新数据
	<form action="userOp.jsp?op=insert" method="post" style="text-align: center">
	<table align=center>
		<tr>
			<td>设备名</td>
			<td>
				<input type="text" name="name"/>
			</td>
		</tr>
		<tr>
			<td>设备数量</td>
			<td>
				<input type="text" name="count"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" text="提交"/>
			</td>
			
			<td>
				<input type="reset" text="重置"/>
			</td>
		</tr>
	</table>
	</form>
	
	
  </body>
</html>
