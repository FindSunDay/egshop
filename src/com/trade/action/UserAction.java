package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.pojo.Role;
import com.trade.pojo.User;
import com.trade.service.MessageService;
import com.trade.service.UserService;



public class UserAction extends BaseAction{
	
private String name;
private String account;
private int id;
private User user;
private UserService userService;
private MessageService messageService;
private List<User> userList;
private List<Role> roleList;

public String initUser(){
	roleList=userService.getRolePromission();
	return SUCCESS;
}

public String addUser(){
	try {
		user.setCreateTime(new Date());
		userService.saveUser(user);
		response.getWriter().write("success");
	} catch (IOException e) {
		e.printStackTrace();
	}
	return null;
}

public String getUserObj(){
	user=userService.getUserObj(id);
	roleList=userService.getRolePromission();
	return SUCCESS;
}

public String valiadeAccount(){
	try {
		boolean flag=userService.valiadeAccount(account);
		response.getWriter().write(flag+"");
	} catch (IOException e) {
		e.printStackTrace();
	}
	return null;
	
}

public String updateUser(){
	try {
		userService.updateUser(user);
		User curLoginUser=(User) session.get(Constants.loginUser);
		if(curLoginUser!=null && curLoginUser.getId().equals(user.getId())) {
			curLoginUser = userService.getUserObj(user.getId());
			session.put(Constants.loginUser,curLoginUser);
		}
		response.getWriter().write("success");
	} catch (IOException e) {
		e.printStackTrace();
	}
	return null;
}

public String getUserManage(){
	try {
		totalCount=userService.countUser(name, account);
		pageCount = (totalCount - 1) / Constants.TotalPage + 1;
		if (super.getCurrentPage() > pageCount) {
			super.setCurrentPage(Long.valueOf(pageCount).intValue());
		}
		userList=userService.getUserList(name, account, getCurrentPage());
		messageService.addMessage("管理员查看【人员管理】");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}

public String deleteUser(){
	try {
		userService.deleteUser(ids);
		response.getWriter().write("success");
	} catch (IOException e) {
		e.printStackTrace();
	}
	return null;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAccount() {
	return account;
}

public void setAccount(String account) {
	this.account = account;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public UserService getUserService() {
	return userService;
}

public void setUserService(UserService userService) {
	this.userService = userService;
}

public List<User> getUserList() {
	return userList;
}

public void setUserList(List<User> userList) {
	this.userList = userList;
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
