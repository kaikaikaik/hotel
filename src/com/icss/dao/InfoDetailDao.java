package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.icss.vo.InfoList;


public class InfoDetailDao {
	public InfoList InfoDetail(Integer id) throws ClassNotFoundException, SQLException{
		InfoList inf = new InfoList();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from index_more where id = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			inf.setId(rs.getInt(1));
			inf.setInfo(rs.getString(2));
			inf.setImg(rs.getString(3));
			inf.setTitle(rs.getString(4));
		}
		rs.close();
		ps.close();
		conn.close();
		return inf;
	}
}
