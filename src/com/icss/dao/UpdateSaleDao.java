package com.icss.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateSaleDao {
	public void UpdateSale(Integer id,String title,String from1,String info,String img,Date date) throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("update package set title=?, from1=?, info=?, img=?,time=? where id=?");
		ps.setString(1, title);
		ps.setString(2, from1);
		ps.setString(3, info);
		ps.setString(4, img);
		ps.setDate(5, date);
		ps.setInt(6, id);
		ps.executeUpdate();
		ps.close();
		conn.close();
	}
}