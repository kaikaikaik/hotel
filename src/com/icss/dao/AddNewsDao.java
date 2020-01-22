package com.icss.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddNewsDao {
	public void AddNews(String title,String from1,String info,String img,Date date) throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("insert into news values(user1_id_seq.nextval,?,?,?,?,?)");
		ps.setString(1, title);
		ps.setString(2, info);
		ps.setString(3, img);
		ps.setString(4, from1);
		ps.setDate(5, date);
		ps.executeUpdate();
		ps.close();
		conn.close();
	}
}
