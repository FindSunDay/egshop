package com.trade.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.trade.dao.BaseDao;
import com.trade.pojo.Message;
import com.trade.pojo.User;
import com.trade.util.DateUtil;

public class OnlineService {

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
	
	public long countMessage(int userId){
		String date=DateUtil.getNowDate();
		String hql="select count(id) from Message where receiveId="+userId+" and createTime>="+date+" order by createTime asc";
		return baseDao.countByhql(hql);
	}
	
	public List<Message> getBackMessage(int userId){
		String date=DateUtil.getNowDate();
		String hql="from Message where receiveId="+userId+" and createTime>="+date+" order by createTime asc";
		return baseDao.findByhql(hql);
	}
	
	public Map<Integer, User> getMessageUser(int userId){
		String date=DateUtil.getNowDate();
		String hql="select distinct(sendId),sendName from Message where receiveId="+userId+" and createTime>="+date+" order by createTime asc";
		List<Object[]> list=baseDao.findByhql(hql);
		Map<Integer, User> map=new HashMap<Integer, User>();
		for(Object[] obj:list){
			User user=new User();
			user.setId(Integer.parseInt(obj[0].toString()));
			user.setName(obj[1].toString());
			map.put(user.getId(), user);
		}
		return map;
	}
	
	public List<Message> getMyMessages(int userId){
		String date=DateUtil.getNowDate();
		String hql="from Message where receiveId="+userId+" or sendId="+userId+" and createTime>="+date+" order by createTime asc";
		return baseDao.findByhql(hql);
	}
	
	public User getUserObj(int id){
		return (User) baseDao.getObj(User.class, id);
	}
}
