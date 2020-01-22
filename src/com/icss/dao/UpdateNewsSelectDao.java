package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.icss.vo.NewsList;

public class UpdateNewsSelectDao {
	public NewsList UpdateNewsSelect(Integer id) throws ClassNotFoundException, SQLException{
		NewsList nl = new NewsList();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from news where id = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			nl.setId(rs.getInt(1));
			nl.setTitle(rs.getString(2));
			nl.setInfo(rs.getString(3));
			nl.setImg(rs.getString(4));
			nl.setFrom1(rs.getString(5));
			nl.setTime(rs.getString(6).substring(0,10));
		}
		rs.close();
		ps.close();
		conn.close();
		return nl;
	}
}
