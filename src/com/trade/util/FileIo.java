
package com.trade.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;



public class FileIo {

	public static  String fileUpload(File file,String fileName,String root){
		
		InputStream is=null;
		OutputStream os=null;
		File deskFile=null;
		String newFile="";
		try {
			File filepath=new File(root);
			if(!filepath.exists()){
				filepath.mkdir();
			}
			is = new FileInputStream(file);
			String name=fileName.substring(fileName.lastIndexOf("."), fileName.length());
			 newFile=new Date().getTime()+name;
		    deskFile = new File(root,newFile);
			os = new FileOutputStream(deskFile);
			byte [] bytefer = new byte[1024];
			int length = 0 ; 
			while((length = is.read(bytefer) )>0)
			{
				os.write(bytefer,0,length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if (os != null) {
					os.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return newFile;
		
	}
	
	  public static void downloadLocal(HttpServletResponse response,String path,String name){
	        // 下载本地文件
	        File file=new File(path);
	        if(file.exists()){
	        // 读到流中
	        	InputStream inStream=null;
	        // 设置输出的格式
	        try {
	          inStream = new FileInputStream(file);// 文件的存放路径
	        response.setCharacterEncoding("UTF-8");
	        response.reset();
	        response.setContentType("bin");
	        response.addHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(name, "UTF-8")+ "\"");
	        // 循环取出流中的数据 
	  	        byte[] b = new byte[1000];
	  	        int data;
	            while ((data = inStream.read(b)) > 0){
	                response.getOutputStream().write(b, 0, data);
	            }
	        } catch (Exception e) {
	        	System.out.println("取消下载");
	        }finally{
	        	if(inStream!=null){
	        		 try {
						inStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
	        	}
	        }
	        }else{
					try {
						response.setCharacterEncoding("GBK");
						response.getWriter().write("<script type=\"text/javascript\">alert(\"文件不存在！\");window.history.back();</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
	        }
	    }
	  
	  
}