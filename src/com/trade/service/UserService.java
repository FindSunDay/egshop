package com.trade.service;

import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.Role;
import com.trade.pojo.User;
import com.trade.util.Array;


public class UserService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	

	public void saveUser(User user){
		baseDao.save(user);
	}
	
	public void updateUser(User user){
		baseDao.update(user);
	}
	
	public User getUserObj(int id){
		return (User) baseDao.getObj(User.class,id);
	}
	
	public Role getRoleObj(int id){
		return (Role) baseDao.getObj(Role.class, id);
	}
	public User loginUser(String account,String psw){
		String hql="from User where account='"+account+"' and psw='"+psw+"'";
		List<User> list=baseDao.findByhql(hql);
		if(list==null||list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
	
	public long countUser(String name,String account){
		String hql="select count(id) from User where 1=1";
		if(name!=null&&!"".equals(name)){
			hql+=" and name like '%"+name.trim()+"%'";
		}
		if(account!=null&&!"".equals(account)){
			hql+=" and account like '%"+account.trim()+"%'";
		}
		return baseDao.countByhql(hql);
	} 
	
	public List<User> getUserList(String name,String account,int currentPage){
		String hql="from User where 1=1";
		if(name!=null&&!"".equals(name)){
			hql+=" and name like '%"+name.trim()+"%'";
		}
		if(account!=null&&!"".equals(account)){
			hql+=" and account like '%"+account.trim()+"%'";
		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteUser(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from User where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
	public List<Role> getRolePromission(){
		String hql="from Role";
		return baseDao.findByhql(hql);
	}
	
	public List<Role> getRolePromission(int type){
		String hql="from Role where type="+type;
		return baseDao.findByhql(hql);
	}
	
	public boolean valiadeAccount(String account){
		String hql="from User where account='"+account.trim()+"'";
		List<User> list=baseDao.findByhql(hql);
		if(list!=null&&!list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}
}
