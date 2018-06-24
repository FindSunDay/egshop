package com.trade.action;
import java.io.File;
import java.util.Date;
import java.util.List;



import com.trade.common.Constants;
import com.trade.pojo.JGys;
import com.trade.pojo.User;
import com.trade.service.*;
public class GYSAction extends BaseAction{
	private JGys gys;
	private Integer id;
	private List<JGys> JGysList;
	private GYSService gyservice;
	private Integer state;
	private Integer cardNum;
	public Integer getCardNum() {
		return cardNum;
	}

	public void setCardNum(Integer cardNum) {
		this.cardNum = cardNum;
	}

	private String startTime;
	private String endTime;
	
	public String saveJGys(){
		try {
		
		
			 gyservice.saveGys(gys);
			 response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getJGysObj(){
		gys=gyservice.getGysObj(id);
		return SUCCESS;
	}
	
	public String updateJGys(){
		try{
			gyservice.updateGys(gys);
			 response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	 
	
	public String getGyss(){
	
		totalCount=gyservice.countGys(state);
		pageCount = (totalCount - 1) / Constants.TotalPage + 1;
		if (super.getCurrentPage() > pageCount) {
			super.setCurrentPage(Long.valueOf(pageCount).intValue());
		}
		JGysList=gyservice.getGysList(state, getCurrentPage());
		return SUCCESS;
	}
	
	public String getGYS(){
		totalCount=gyservice.countGys(state);
		pageCount = (totalCount - 1) / Constants.TotalPage + 1;
		if (super.getCurrentPage() > pageCount) {
			super.setCurrentPage(Long.valueOf(pageCount).intValue());
		}
		JGysList=gyservice.getGysList(state, getCurrentPage());
		return SUCCESS;
	}
	
	public String deleteJGys(){
		try{
			gyservice.deleteGys(ids);
		response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}





	public JGys getGys() {
		return gys;
	}

	public void setGys(JGys gys) {
		this.gys = gys;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<JGys> getJGysList() {
		return JGysList;
	}

	public void setJGysList(List<JGys> jGysList) {
		JGysList = jGysList;
	}


	public GYSService getGyservice() {
		return gyservice;
	}

	public void setGyservice(GYSService gyservice) {
		this.gyservice = gyservice;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}
