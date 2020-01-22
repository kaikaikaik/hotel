package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDao {
	public boolean AdminLogin(String username,String password) throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from admin_user where name = ? and password = ?");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			rs.close();
			ps.close();
			conn.close();
			return true;
		}else{
			rs.close();
			ps.close();
			conn.close();
			return false;
		}
	}
}
