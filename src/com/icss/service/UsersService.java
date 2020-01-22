package com.icss.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.icss.dao.*;
import com.icss.vo.Users;

public class UsersService {
	UsersDao ud=new UsersDao();
	public ArrayList<Users> showAllService() throws ClassNotFoundException, SQLException{
		return ud.showAllDao();
	}
	public void deleteUserService(Integer id) throws ClassNotFoundException, SQLException{
		ud.deleteUserDao(id);
	}
	public void addUserService(String name,String password,String nickname,String email,String mibao,String avatar) throws ClassNotFoundException, SQLException{
		ud.addUsersDao(name, password, nickname, email, mibao, avatar);
	}
	public Users updateSelectUserService(Integer id) throws ClassNotFoundException, SQLException{
		return ud.updateSelectUserDao(id);
	}
	public void updateUserService(Integer id,String name,String password,String nickname,String email,String mibao,String avatar) throws ClassNotFoundException, SQLException{
		ud.updateUserDao(id, name, password, nickname, email, mibao, avatar);
	}
}
