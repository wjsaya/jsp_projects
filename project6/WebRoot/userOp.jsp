<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
		<%
			String op = request.getParameter("op");
						
			if ("add".equals(op)) {
				response.sendRedirect("add.jsp");
			} else if ("modify".equals(op)) {
				out.println("修改");
			} else if ("delete".equals(op)) {
				out.println("删除");
			} else if ("insert".equals(op)) {
				project6.userDb mydb = new project6.userDb();
				String name = request.getParameter("name");
				String count = request.getParameter("count");
				String sqli = "INSERT INTO `info` (`name`, `count`) VALUES(?, ?);";
				boolean re = mydb.doExecute(sqli, new String[]{name, count});
				if (re) {
					out.println("<SCRIPT>ALERT('插入成功');</SCRIPT>");					
				} else {
					out.println("<SCRIPT>ALERT('插入失败');</SCRIPT>");						
				}
				
			}  else {
				out.println("非法访问");
			}
		%>

  </body>
</html>
