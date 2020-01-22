package com.icss.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.service.HotelInfoService;
import com.icss.vo.InfoList;
import com.icss.vo.NewsList;
import com.icss.vo.Packages;

/**
 * Servlet implementation class TuiSongServlet
 */
@WebServlet("/OnloadServlet")
public class OnloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HotelInfoService his = new HotelInfoService();
		ArrayList<Packages> al = new ArrayList<Packages>();
		ArrayList<InfoList> ifl = new ArrayList<InfoList>();
		ArrayList<NewsList> nl = new ArrayList<NewsList>();
		try {
			al = his.PackageListService();
			ifl = his.InfoListService();
			nl = his.NewsListService();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("packageList", al);
		request.setAttribute("infoList", ifl);
		request.setAttribute("newsList", nl);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}