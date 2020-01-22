package com.icss.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.icss.service.HotelInfoService;

/**
 * Servlet implementation class AddSaleListServlet
 */
@WebServlet("/UpdateSaleServlet")
public class UpdateSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @return 
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSaleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter writer = response.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return;
		}
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);
		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录
		String uploadPath = getServletContext().getRealPath("/");
		// 如果目录不存在则创建
		File uploadDir = new File("save_path:" + uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			// 解析请求的内容提取文件数据
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);
			int index = 0;
			int flag = 0;
			String id = request.getParameter("id");
			int idF = Integer.parseInt(id);
			String title = null;
			String from1 = null;
			String info = null;
			String time = null;
			String newFileName = null;
			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					// 处理不在表单中的字段
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						if(!("".equals(fileName))){
							newFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName.substring(fileName.lastIndexOf("."));
							File file = new File(uploadPath,newFileName);
							item.write(file);
						}
					}
				}
			}
			HotelInfoService his = new HotelInfoService();
			for (FileItem fileItem : formItems) {
				if (fileItem.isFormField()) {
					index++;
					String value = fileItem.getString();
					value = new String(value.getBytes("iso8859-1"), "utf-8");
					if (index == 1) {
						if (value == null || "".equals(value)) {
							request.setAttribute("title", "折扣标题不能为空");
							flag = 1;
						} else {
							title = value;
						}
						request.setAttribute("inputtitle", value);
					}
					if (index == 2) {
						if (value == null || "".equals(value)) {
							request.setAttribute("from", "折扣来源不能为空");
							flag = 1;
						} else {
							from1 = value;
						}
						request.setAttribute("inputfrom", value);
					}
					if (index == 3) {
						if (value == null || "".equals(value)) {
							request.setAttribute("info", "相关描述不能为空");
							flag = 1;
						} else {
							info = value;
						}
						request.setAttribute("inputinfo", value);
					}
					if (index == 4) {
						if (value == null || "".equals(value)) {
							request.setAttribute("time", "时间不能为空");
							flag = 1;
						} else {
							time = value;
						}
						request.setAttribute("inputtime", value);
					}else{}
				}
			}
			if(flag==1){
				request.getRequestDispatcher("UpdateSaleListServlet").forward(request, response);
			}
			java.util.Date date = null;
			date = new SimpleDateFormat("yyyy-MM-dd").parse(time);
			java.sql.Date newdate = new java.sql.Date(date.getTime());
			his.UpdateSale(idF, title, from1, info, newFileName, newdate);
			request.getRequestDispatcher("PackageManageServlet").forward(request, response);
		} catch (Exception ex) {
			request.setAttribute("msg", "错误信息: " + ex.getMessage());
		}
	}
}