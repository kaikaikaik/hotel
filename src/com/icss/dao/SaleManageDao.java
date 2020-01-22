package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.icss.vo.Packages;

public class SaleManageDao {
	public ArrayList<Packages> SaleManage() throws ClassNotFoundException, SQLException{
		ArrayList<Packages> packagelist = new ArrayList<Packages>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
		PreparedStatement ps = conn.prepareStatement("select * from package");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Packages pag = new Packages();
			pag.setId(rs.getInt(1));
			pag.setTitle(rs.getString(2));
			pag.setInfo(rs.getString(3));
			pag.setImg(rs.getString(4));
			pag.setFrom1(rs.getString(5));
			pag.setTime(rs.getString(6).substring(0,10));
			packagelist.add(pag);
		}
		rs.close();
		ps.close();
		conn.close();
		return packagelist;
	}
}
