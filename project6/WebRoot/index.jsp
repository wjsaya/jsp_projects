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
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body style="text-align:center">
	<h3>数据库增删查改</h3>
	<a href="userOp.jsp?op=add" >插入新数据</a>
<br><br><br>
	<table border="1px"  align=center>
		<tr>
			<td>编号</td>
			<td>名字</td>
			<td>数量</td>
			<td>操作</td>
		</tr>
		<tr>
			<%
				String driver = "com.mysql.jdbc.Driver";
				// URL指向要访问的数据库名test1
				String url = "jdbc:mysql://127.0.0.1:3306/project6";
				// MySQL配置时的用户名
				String user = "project6";
				// Java连接MySQL配置时的密码
				String password = "project6";
				try {
				// 1 加载驱动程序
				Class.forName(driver);
				// 2 连接数据库
				Connection conn = DriverManager.getConnection(url, user, password);
				// 3 用来执行SQL语句
				Statement statement = conn.createStatement();
				// 要执行的SQL语句
				String sql = "select * from info";
				ResultSet rs = statement.executeQuery(sql);
				String id = null;
				String name = null;
				String count = null;
				while (rs.next()) {
					id = rs.getString("id");	
					name = rs.getString("name");	
					count = rs.getString("count"); 
					String modify = "<a href='userOp.jsp?op=modify&id=" + id + "'>修改</a>";
					String delete = "<a href='userOp.jsp?op=delete&id=" + id + "'>删除</a>";
					out.print("<tr>");
					out.print("<td>" + id + "</td>");
					out.print("<td>" + name + "</td>");
					out.print("<td>" + count + "</td>");
					out.print("<td>" + modify + "| |" + delete + "</td>");
					out.print("</tr>");
				}
				rs.close();
				conn.close();
				} catch (ClassNotFoundException e) {
					out.print("Sorry,can`t find the Driver!");
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}	
			%>
		</tr>
	</table>
  </body>
</html>
