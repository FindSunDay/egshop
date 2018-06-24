package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.pojo.Message;
import com.trade.pojo.User;
import com.trade.service.MessageService;
import com.trade.service.UserService;


public class MessageAction extends BaseAction{

	private int id;
	private String name;
	private Message message;
	private MessageService messageService;
	private List<Message> messageList;
	private UserService userService;
	
	public String message_init(){
		return SUCCESS;
	}
	public String addMessage(){
		try {
			User user=(User) session.get(Constants.loginUser);
			User receive=userService.getUserObj(id);
			message.setReceiverId(receive.getId());
			message.setReceiverName(receive.getName());
			message.setCreateTime(new Date());
			message.setUserId(user.getId());
			message.setIsRead(Constants.noRead);
			message.setUserName(user.getName());
			messageService.saveMessage(message);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getMessageObj(){
		message=messageService.getMessageObj(id);
		if(message.getIsRead()!=1){
			message.setIsRead(Constants.yesRead);
			messageService.updateMessage(message);
		}
		return SUCCESS;
	}
	
	
	public String getMessageManage(){
		try {
			User user=(User) session.get(Constants.loginUser);
			totalCount=messageService.countMessage(name,user.getId());
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			messageList=messageService.getMessageList(name,user.getId(), getCurrentPage());
			//messageService.addMessage("管理员查看【公告管理】");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String countReadMessage(){
		try {
			User user=(User) session.get(Constants.loginUser);
			long total=messageService.countReadMessage(user.getId());
			response.getWriter().write(total+"");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String deleteMessage(){
		try {
			messageService.deleteMessage(ids);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
