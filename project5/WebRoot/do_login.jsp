<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.net.ConnectException"%>
<%@ page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>do_login</title>


</head>

<body>

	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

  if(name==null||"".equals(name.trim())||pass==null||"".equals(pass.trim())){
	  System.out.println("用户名或密码不能为空！");
	  response.sendRedirect("login.jsp");
	  return;
  }
  
		//加载驱动程序 
		String driverName = "com.mysql.jdbc.Driver";
		//数据库信息
		String userName = "project5dbUser";
		//密码 
		String userPasswd = "asdqwd312321e321dw";
		//数据库名 
		String dbName = "project5";
		//将数据库信息字符串连接成为一个完整的url（也可以直接写成url，分开写是明了可维护性强） 
		String userTable = "testusertable";
	//	String url = "jdbc:mysql://localhost:3306/" + dbName + "?user=" + userName + "&password=" + userPasswd;

		Connection conn = null;
		PreparedStatement pre = null;// 创建预编译语句对象，一般都是用这个而不用Statement
		  ResultSet result = null;// 创建一个结果集对象
		
	
		String usersql = "SELECT * FROM " + userTable + " where uName = ? and uPass = ?";
		
		try {
		      String url = "jdbc:mysql://" + "localhost:3306/" + dbName;// 127.0.0.1是本机地址，orcl是Oracle的默认数据库名

		      conn = DriverManager.getConnection(url, userName, userPasswd);// 获取连接
		} catch (Exception e) {
			//e.printStackTrace();
			out.print("数据库连接失败!!!<br><br>");
			response.setHeader("refresh", "5;URL=login.jsp");
		}
			  pre = conn.prepareStatement(usersql);// 实例化预编译语句
					  
		      pre.setString(1, name);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
		      pre.setString(2, pass);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
		      result = pre.executeQuery();// 执行查询，注意括号中不需要再加参数
		      
			//Class.forName(driverName).newInstance();
			//conn = DriverManager.getConnection(url);
		//Statement stmt = conn.createStatement();
		//out.print("数据库连接成功!!!<br><br>");
		//String sql = "SELECT * FROM " + userTable + " where uName = '" + name + "' and uPass = '" + pass + "'";
		//out.print(sql);
		//ResultSet rs = stmt.executeQuery(sql);
		
		if (result.next()) {
			out.print("正确用户名：admin，密码：admin<br>");
			out.print("对不起，此用户名和密码登录失败!!!<br>");
			out.print("5秒后自动跳转到登录界面");
			response.setHeader("refresh", "5;URL=login.jsp");
		} else {
			out.print("你好" + name);
			out.print("<br>你的密码是" + pass);
			session.setAttribute("username", name);
		}
	%>



</body>
</html>
