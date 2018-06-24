package com.trade.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {
	  private String uploadPath = "uploadFile/"; // 上传文件的目录  
	    private String tempPath = "uploadFiletmp/"; // 临时文件目录  
	    private String serverPath = null;
	    
	    private int sizeMax = 3;//图片最大上限
	    private String[] fileType = new String[]{".jpg",".gif",".bmp",".png",".jpeg",".ico"};
	    
	    public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html");
	        response.setCharacterEncoding("utf-8"); //设置编码，防止返回的中文乱码
	        
	        serverPath = getServletContext().getRealPath("/").replace("\\", "/");
	        //Servlet初始化时执行,如果上传文件目录不存在则自动创建
	        if(!new File(serverPath+uploadPath).isDirectory()){
	            new File(serverPath+uploadPath).mkdirs();
	        }
	        if(!new File(serverPath+tempPath).isDirectory()){
	            new File(serverPath+tempPath).mkdirs();
	        }

	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        factory.setSizeThreshold(5*1024); //最大缓存
	        factory.setRepository(new File(serverPath+tempPath));//临时文件目录
	        
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setSizeMax(sizeMax*1024*1024);//文件最大上限
	        
	        String filePath = null;
	        try {
	            List<FileItem> items = upload.parseRequest(request);//获取所有文件列表
	            for (FileItem item : items) {
	                //获得文件名，这个文件名包括路径
	                if(!item.isFormField()){
	                    //文件名
	                    String fileName = item.getName().toLowerCase();
	                    
	                    if(fileName.endsWith(fileType[0])||fileName.endsWith(fileType[1])||fileName.endsWith(fileType[2])||fileName.endsWith(fileType[3])||fileName.endsWith(fileType[4])||fileName.endsWith(fileType[5])){
	                        String uuid = UUID.randomUUID().toString();
	                        filePath = serverPath+uploadPath+uuid+fileName.substring(fileName.lastIndexOf("."));
	                        item.write(new File(filePath));
	                        System.out.println(filePath);
	                        PrintWriter pw = response.getWriter();
	                        pw.write("<script>alert('上传成功');window.returnValue='"+uploadPath+uuid+fileName.substring(fileName.lastIndexOf("."))+"';window.close();</script>");
	                        pw.flush();
	                        pw.close();
	                    }else{
	                        request.setAttribute("errorMsg", "上传失败,请确认上传的文件存在并且类型是图片!");
	                        request.getRequestDispatcher("/upload.jsp").forward(request,response);
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMsg", "上传失败,请确认上传的文件大小不能超过"+sizeMax+"M");
	            request.getRequestDispatcher("/upload.jsp").forward(request,response);
	        }
	    }
}
