package com.icss.servlet;

import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

/**
 * 文件进度监听类
 * Application Lifecycle Listener implementation class UploadProgressListener
 *
 */
public class UploadProgressListener implements ProgressListener {	
	private HttpSession session;
	private long kiloBytes = -1;
	
	public UploadProgressListener(HttpServletRequest request) {
		this.session = request.getSession();
	}

	@Override
	public void update(long PBytesRead, long PContenLength, int Pltems) {

		Long KBytes = PBytesRead/1024;
		if(kiloBytes == KBytes) {
			return;
		}
		kiloBytes = KBytes;
		System.out.println("���ڶ�ȡ��Ŀ" + KBytes);
		if(PContenLength == -1) {
			System.out.println("Ŀǰ�Ѿ���ȡ��" + PBytesRead + "�ֽ�����");
		} else {
			System.out.println("Ŀǰ�Ѿ���ȡ��" + PContenLength + "�е�" + PBytesRead + "�ֽ�����");
		}
		// ��ȡ�ϴ����ȵİٷֱ�
		double read = ((double)KBytes)/(PContenLength/1024);
		NumberFormat nf = NumberFormat.getPercentInstance();
		session.setAttribute("key", nf.format(read));
		System.out.println("����ʱ�䣺" + nf.format(read));
		
	}  
}
