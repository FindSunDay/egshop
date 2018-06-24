package com.trade.service;

import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.dao.BaseDao;
import com.trade.pojo.Message;
import com.trade.util.Array;


public class MessageService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveMessage(Message message){
		baseDao.save(message);
	}
	public void updateMessage(Message member){
		baseDao.update(member);
	}
	public Message getMessageObj(int id){
		return (Message) baseDao.getObj(Message.class, id);
	}
	
	public long countMessage(String userName,int userId){
		//String hql="select count(id) from Message where receiverId="+userId;
		String hql="select count(id) from Message ";
		if(userName!=null&&!"".equals(userName)){
			hql+=" and userName like '%"+userName.trim()+"%'";
		}
		return baseDao.countByhql(hql);
	} 
	
	public long countReadMessage(int userId){
		String hql="select count(id) from Message where isRead=0 and receiverId="+userId;
		return baseDao.countByhql(hql);
	} 
	
	public List<Message> getMessageList(String name,int userId,int currentPage){
		//String hql="from Message where receiverId="+userId;
		String hql="from Message";
		if(name!=null&&!"".equals(name)){
			hql+=" and userName like '%"+name.trim()+"%'";
		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteMessage(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from Message where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
	public void addMessage(String content) {
		Message message = new Message();
		//message.setReceiverId(1);
		message.setCreateTime(new Date());
		message.setContent(content);
		baseDao.save(message);
	}
	
}
