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
  
  <body style="text-align: center">
  
  	<%
			String op = request.getParameter("op");
			String old_id= request.getParameter("id");
			String title = "";
			String old_name = "";
			String old_count = "";
			String target = "";
			
			if ("add".equals(op)) {
				title = "新增";
				out.println(title);
				target = "userOp.jsp?op=insert";
				
			} else if ("update".equals(op)) {
				title = "修改";
				target = "userOp.jsp?op=update";
				project6.userDb mydb = new project6.userDb();
				String sqli = "SELECT * FROM `info` WHERE `id`=?;";
				try{
					ResultSet rs = mydb.doQuery(sqli, new String[]{old_id});
					if(rs.next()) {
						old_name = rs.getString("name");
						old_count = rs.getString("count");						
					} else {
							out.println("<script>alert('没有数据！！！');window.location='index.jsp'</script>");	
					}
				} catch (Exception e){
					e.printStackTrace();
				}
			} else {
				title = "非法访问";
				out.println(title);
			}
   %>
	
	<%=title %>
	<form action=<%=target %> method="post" style="text-align: center">
	<table align=center>
		<tr>
			<td>设备名</td>
			<td>
				<input type="hidden" name="id" value=<%=old_id %>>
				<input type="text" name="name" value=<%=old_name %>>
			</td>
		</tr>
		<tr>
			<td>设备数量</td>
			<td>
				<input type="text" name="count" value=<%=old_count %>>
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
