package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.icss.vo.Users;
//��ʾ
public class UsersDao {
	public ArrayList<Users> showAllDao() throws ClassNotFoundException, SQLException{
		ArrayList<Users> al = new ArrayList<Users>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:Oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
 	PreparedStatement ps =
 	conn.prepareStatement("select * from users");
 	ResultSet rs = ps.executeQuery();
 	while(rs.next()){
 		Users t = new Users();
 		t.setId(rs.getInt(1));
 		t.setName(rs.getString(2));
 		t.setPassword(rs.getString(3));
 		t.setNickname(rs.getString(4));
 		t.setEmail(rs.getString(5));
 		t.setMibao(rs.getString(6));
 		t.setAvatar(rs.getString(7));
 		al.add(t);
 	}
 	rs.close();
	ps.close();
	conn.close();
 	return al;
}
//ɾ��
	public void deleteUserDao(Integer id) throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:Oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
		PreparedStatement ps =conn.prepareStatement("delete from users where id=?");
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
		conn.close();
	}
//����
	public void addUsersDao(String name,String password,String nickname,String email,String mibao,String avatar) throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:Oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
		PreparedStatement ps =conn.prepareStatement("insert into users values(user1_id_seq.nextval,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, password);
		ps.setString(3, nickname);
		ps.setString(4, email);
		ps.setString(5, mibao);
		ps.setString(6, avatar);
		ps.executeUpdate();
		ps.close();
		conn.close();	
	}
//�޸�
public Users updateSelectUserDao(Integer id) throws ClassNotFoundException, SQLException{
	Users ut =new Users();
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:Oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
	PreparedStatement ps =conn.prepareStatement("select * from users where id =?");
	ps.setInt(1, id);
	ResultSet rs =ps.executeQuery();
	if(rs.next()){
		ut.setId(rs.getInt(1));
		ut.setName(rs.getString(2));
		ut.setPassword(rs.getString(3));
		ut.setNickname(rs.getString(4));
		ut.setEmail(rs.getString(5));
		ut.setMibao(rs.getString(6));
		ut.setAvatar(rs.getString(7));
	}
	rs.close();
	ps.close();
	conn.close();
	return ut;
	
}
public void updateUserDao(Integer id,String name,String password,String nickname,String email,String mibao,String avatar) throws ClassNotFoundException, SQLException {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:Oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
	PreparedStatement ps =conn.prepareStatement("update users set name=?,password=?,nickname=?,email=?,mibao=?,avatar=? where id=?");
	ps.setString(1, name);
	ps.setString(2, password);
	ps.setString(3, nickname);
	ps.setString(4, email);
	ps.setString(5, mibao);
	ps.setString(6, avatar);
	ps.setInt(7,id);
	ps.executeUpdate();
	ps.close();
	conn.close();
}

}


