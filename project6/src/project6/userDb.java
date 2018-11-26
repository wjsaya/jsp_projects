package project6;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class userDb {
	Connection conn = null;

	public userDb() {
		String driver = "com.mysql.jdbc.Driver";
		// URL指向要访问的数据库名test1
		String url = "jdbc:mysql://127.0.0.1:3306/project6";
		// MySQL配置时的用户名
		String user = "project6";
		// Java连接MySQL配置时的密码
		String pass = "project6";
		try {
			// 1 加载驱动程序
			Class.forName(driver);
			// 2 连接数据库
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.print("Sorry,can`t find the Driver!");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public boolean doExecute(String sqli, String[] parms) {
		//无返回值执行，直接返回真假即可
		boolean re = false;
		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(sqli);
			for(int i=0; i<parms.length; i++) {
				ps.setString(i+1, parms[i]);
				System.out.println(parms[i]);
			}
			System.out.print(ps.toString());
			re = ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return re;
	}

	public ResultSet doQuery(String sqli) {
		//返回结果，ResultSet
		ResultSet re = null;
		try {
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(sqli);
			ResultSet rs = statement.executeQuery(sqli);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return re;
	}
	
	
}
// 3 用来执行SQL语句

/*
 * String name = request.getParameter("name"); int count =
 * Integer.valueOf(request.getParameter("count")); String
 * sql="Insert into info(name, count) values(?,?)";
 * 
 * PreparedStatement pstmt = conn.prepareStatement(sql); pstmt.setString(1,
 * name); pstmt.setInt(2, count); if (pstmt.executeUpdate() == 1) {
 * out.print("数据插入成功！"); } else { out.print("数据插入失败！"); } pstmt.close();
 * conn.close();
 */
