package com.trade.action;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;

import com.trade.common.Constants;
import com.trade.pojo.Message;
import com.trade.pojo.Role;
import com.trade.pojo.User;
import com.trade.service.MessageService;
import com.trade.service.UserService;


public class LoginAction extends BaseAction{

	private String account;
	private String psw;
	private String authImageCode;
	private UserService userService;
	private MessageService messageService;
	private User user;
	private List<Role> roleList;
	public String login(){
	     try {
	    	      response.setCharacterEncoding("utf-8");
	    	      String authCode = (String) request.getSession(true).getAttribute("authCode");
	    	      if(!StringUtils.equalsIgnoreCase(authImageCode, authCode)) {
	    	    	      response.getWriter().write("验证码错误");
	    	    	      return null;
	    	      }
	    		  User user=userService.loginUser(account, psw);
			 if(user==null){
				 response.getWriter().write("用户名或密码不存在");
			 }else{
				 Role role=userService.getRoleObj(user.getRoleId());
				 session.put("loginDate", new Date());
				 session.put("userRole", role);
				 session.put(Constants.loginUser, user);
				 if(role.getId()!=null && role.getId()==1) {
				     messageService.addMessage(role.getName() + "登录系统");
				 }
				 response.getWriter().write("success");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String loginOut(){
		Role role = (Role) session.get("userRole");
		if(role!=null && role.getId()!=null && role.getId()==1) {
		     messageService.addMessage(role.getName() + "退出登录");
		 }
		session.clear();
		return SUCCESS;
	}

	
	public String registerUser(){
		try {
			List<Role> list=userService.getRolePromission(1);
			if(list!=null&&!list.isEmpty()){
				Role role=list.get(0);
				user.setRoleId(role.getId());
				user.setMoney(role.getInitPrice());
			}
			user.setCreateTime(new Date());
			userService.saveUser(user);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String yzAccount(){
		try {
			boolean flag=userService.valiadeAccount(account);
			response.getWriter().write(flag+"");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public String userInfoInit(){
			return SUCCESS;
	}
	
	public String  updatePerson(){
		try {
			User old=(User) session.get(Constants.loginUser);
			User usernew=userService.getUserObj(old.getId());
			usernew.setName(user.getName());
			usernew.setEmail(user.getEmail());
			if(user.getPsw()!=null&&!"".equals(user.getPsw())){
				usernew.setPsw(user.getPsw());
				userService.updateUser(usernew);
				response.getWriter().write("login");
			}else{
				userService.updateUser(usernew);
				session.put(Constants.loginUser, usernew);
				response.getWriter().write("success");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	public String updateMyMoney(){
		try {
			User old=(User) session.get(Constants.loginUser);
			User usernew=userService.getUserObj(old.getId());
			if(usernew.getMoney()==null){
				usernew.setMoney(new BigDecimal(0));
			}
			usernew.setMoney(usernew.getMoney().add(user.getMoney()));
			userService.updateUser(usernew);
			session.put(Constants.loginUser, usernew);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String advanceMyMoney(){
		try {
			response.setCharacterEncoding("utf-8");
			User old=(User) session.get(Constants.loginUser);
			User usernew=userService.getUserObj(old.getId());
			if(usernew.getMoney()==null){
				usernew.setMoney(new BigDecimal(0));
			}
			usernew.setMoney(usernew.getMoney().subtract(user.getMoney()));
			if(usernew.getMoney().doubleValue()<0) {
				response.getWriter().write("余额不足！");
				return null;
			}
			userService.updateUser(usernew);
			session.put(Constants.loginUser, usernew);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}
	
	

	/**
	 * @return the authImageCode
	 */
	public String getAuthImageCode() {
		return authImageCode;
	}

	/**
	 * @param authImageCode the authImageCode to set
	 */
	public void setAuthImageCode(String authImageCode) {
		this.authImageCode = authImageCode;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	/**
	 * @return the messageService
	 */
	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * @param messageService the messageService to set
	 */
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	
}
