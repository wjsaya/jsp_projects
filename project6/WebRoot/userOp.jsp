<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>userOp</title>
    
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
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String op = request.getParameter("op");
						
			if ("add".equals(op)) {
				response.sendRedirect("getInput.jsp?op=add");
				
			} else if ("modify".equals(op)) {
				String id = request.getParameter("id");
				response.sendRedirect("getInput.jsp?op=update&id=" + id);
				
			} else if ("update".equals(op)) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				System.out.println("userOp:" + name);
				String count = request.getParameter("count");
				String sqli = "UPDATE `info` SET `name`=?, `count`=? WHERE `id`=?";
				
				project6.userDb mydb = new project6.userDb();
				int re = mydb.doExecute(sqli, new String[]{name, count, id});
					if (re != 0) {
						out.println("<script>alert('修改成功');window.location='index.jsp'</script>");	
					} else {
						out.println("<script>alert('修改失败');window.location='index.jsp'</script>");					
					}
				
			} else if ("delete".equals(op)) {
				String id = request.getParameter("id");
				if(id.length() != 0) {//长度非空，删除
					project6.userDb mydb = new project6.userDb();
					String sqli = "DELETE FROM `info` WHERE `id`=?;";
					int re = mydb.doExecute(sqli, new String[]{id});
					System.out.println(re);
					if (re != 0) {
						out.println("<script>alert('删除成功');window.location='index.jsp'</script>");	
					} else {
						out.println("<script>alert('删除失败');window.location='index.jsp'</script>");					
					}
				}
				
			} else if ("insert".equals(op)) {
				project6.userDb mydb = new project6.userDb();
				String name = request.getParameter("name");
				String count = request.getParameter("count");
				String sqli = "INSERT INTO `info` (`name`, `count`) VALUES(?, ?);";
				int re = mydb.doExecute(sqli, new String[]{name, count});
				
				if (re != 0) {
					out.println("<script>alert('插入成功');window.location='index.jsp'</script>");	
				} else {
					out.println("<script>alert('插入失败');window.location='insert.jsp'</script>");					
				}
				
			}  else {
				out.println("非法访问");
			}
		%>

  </body>
</html>
