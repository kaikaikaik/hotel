package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.icss.vo.InfoList;


public class InfoListDao {
	public ArrayList<InfoList> InfoList() throws ClassNotFoundException, SQLException{
		ArrayList<InfoList> infolist = new ArrayList<InfoList>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from index_more");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			InfoList ifl = new InfoList();
			ifl.setId(rs.getInt(1));
			ifl.setInfo(rs.getString(2).substring(0,132)+"...");
			ifl.setImg(rs.getString(3));
			ifl.setTitle(rs.getString(4));
			infolist.add(ifl);
		}
		rs.close();
		ps.close();
		conn.close();
		return infolist;
	}
}
