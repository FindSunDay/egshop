package com.trade.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class UploadAction extends BaseAction{
	private File file;
	
	public void upload(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmss");
		Random r=new Random();
		String path=ServletActionContext.getServletContext().getRealPath("/");
		String imgName=sdf.format(new Date())+r.nextInt(100)+".jpg";
		try {
			FileUtils.copyFile(file,new File(path+"uploadFile\\"+imgName));
			ServletActionContext.getResponse().getWriter().print("uploadFile/"+imgName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	
}
