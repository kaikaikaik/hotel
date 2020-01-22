package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.icss.vo.Packages;

public class UpdateSaleListDao {
	public Packages UpdateSaleList(Integer id) throws ClassNotFoundException, SQLException{
		Packages pg = new Packages();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from package where id = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			pg.setId(rs.getInt(1));
			pg.setTitle(rs.getString(2));
			pg.setInfo(rs.getString(3));
			pg.setImg(rs.getString(4));
			pg.setFrom1(rs.getString(5));
			pg.setTime(rs.getString(6).substring(0,10));
		}
		rs.close();
		ps.close();
		conn.close();
		return pg;
	}
}
