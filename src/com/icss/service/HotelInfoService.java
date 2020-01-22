package com.icss.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import com.icss.dao.AddNewsDao;
import com.icss.dao.AddSaleListDao;
import com.icss.dao.AdminLoginDao;
import com.icss.dao.DeleteNewsDao;
import com.icss.dao.DeletePackageDao;
import com.icss.dao.InfoDetailDao;
import com.icss.dao.InfoListDao;
import com.icss.dao.NewsListDao;
import com.icss.dao.NewsManageDao;
import com.icss.dao.PackagesListDao;
import com.icss.dao.SaleManageDao;
import com.icss.dao.UpdateNewsDao;
import com.icss.dao.UpdateNewsSelectDao;
import com.icss.dao.UpdateSaleDao;
import com.icss.dao.UpdateSaleListDao;
import com.icss.vo.InfoList;
import com.icss.vo.NewsList;
import com.icss.vo.Packages;

public class HotelInfoService {
	//酒店首页优惠信息
	public ArrayList<Packages> PackageListService() throws ClassNotFoundException, SQLException{
		PackagesListDao pd = new PackagesListDao();
		return pd.PackageList();
	}
	//酒店首页醉温泉
	public ArrayList<InfoList> InfoListService() throws ClassNotFoundException, SQLException{
		InfoListDao ifd = new InfoListDao();
		return ifd.InfoList();
	}
	//酒店首页新闻信息
	public ArrayList<NewsList> NewsListService() throws ClassNotFoundException, SQLException{
		NewsListDao nld = new NewsListDao();
		return nld.NewsList();
	}
	//首页醉温泉详细了解
	public InfoList InfoDetailService(Integer id) throws ClassNotFoundException, SQLException{
		InfoDetailDao idd = new InfoDetailDao();
		return idd.InfoDetail(id);
	}
	//后台管理员登录验证
	public boolean AdminLoginService(String username,String password) throws ClassNotFoundException, SQLException{
		AdminLoginDao ald = new AdminLoginDao();
		return ald.AdminLogin(username, password);
	}
	//后台酒店优惠查询
	public ArrayList<Packages> SaleManageService() throws ClassNotFoundException, SQLException{
		SaleManageDao smd = new SaleManageDao();
		return smd.SaleManage();
	}
	//后台删除优惠信息
	public void DeletePackageService(Integer id) throws ClassNotFoundException, SQLException{
		DeletePackageDao dpd = new DeletePackageDao();
		dpd.DeletePackage(id);
	}
	//后台修改优惠信息之查询
	public Packages UpdateSaleList(Integer id) throws ClassNotFoundException, SQLException{
		UpdateSaleListDao usd = new UpdateSaleListDao();
		return usd.UpdateSaleList(id);
	}
	//后台修改用户信息
	public void UpdateSale(Integer id,String title,String from1,String info,String img, Date date) throws ClassNotFoundException, SQLException{
		UpdateSaleDao usd = new UpdateSaleDao();
		usd.UpdateSale(id, title, from1, info, img, date);
	}
	//增加优惠信息
	public void AddSaleList(String title,String from1,String info,String img,Date date) throws ClassNotFoundException, SQLException{
		AddSaleListDao asd = new AddSaleListDao();
		asd.AddSaleList(title, from1, info, img, date);
	}
	//后台管理新闻信息
	public ArrayList<NewsList> NewsManageService() throws ClassNotFoundException, SQLException{
		NewsManageDao nmd = new NewsManageDao();
		return nmd.NewsManage();
	}
	//后台删除新闻信息
	public void DeleteNewsService(Integer id) throws ClassNotFoundException, SQLException{
		DeleteNewsDao dnd = new DeleteNewsDao();
		dnd.DeleteNews(id);
	}
	//后台增加新闻信息
	public void AddNewsService(String title,String from1,String info,String img,Date date) throws ClassNotFoundException, SQLException{
		AddNewsDao and = new AddNewsDao();
		and.AddNews(title, from1, info, img, date);
	}
	//后台修改新闻信息之查询
	public NewsList UpdateNewsSelectService(Integer id) throws ClassNotFoundException, SQLException{
		UpdateNewsSelectDao unsd = new UpdateNewsSelectDao();
		return unsd.UpdateNewsSelect(id);
	}
	//后台修改新闻信息
	public void UpdateNewsService(Integer id,String title,String from1,String info,String img, Date date) throws ClassNotFoundException, SQLException{
		UpdateNewsDao und = new UpdateNewsDao();
		und.UpdateNews(id, title, from1, info, img, date);
	}
}