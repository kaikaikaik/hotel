package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteNewsDao {
		public void DeleteNews(Integer id) throws ClassNotFoundException, SQLException{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
			PreparedStatement ps = conn.prepareStatement("delete from news where id = ?");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}
}