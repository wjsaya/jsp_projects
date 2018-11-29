package project6;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

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
			System.out.println("Sorry,can`t find the Driver!");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public int doExecute(String sqli, String[] parms) {
		//无返回值执行，直接返回真假即可
		int re = 0;
		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(sqli);
			for(int i=0; i<parms.length; i++) {
				ps.setString(i+1, parms[i]);
		//		System.out.println(parms[i]);
			}
			System.out.println("doExecute方法");
			System.out.println(parms[0]);
			System.out.println(ps.toString());
			re = ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return re;
	}

	public ResultSet doQuery(String sqli, String[] parms) {
		//返回结果，ResultSet
		ResultSet re = null;
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sqli);
			for(int i=0; i<parms.length; i++) {
				ps.setString(i+1, parms[i]);
			}
			System.out.println("query实际代码：" + ps.toString());
			re = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return re;
	}
}

