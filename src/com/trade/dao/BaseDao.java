package com.trade.dao;

import java.util.List;


public interface BaseDao {

	public abstract void save(Object entity);
	
	public abstract void update(Object entity);
	
	public abstract void delete(Object entity);
	
	public abstract Long countByhql(String hql);
	
	public abstract long countBysql(String sql);
	
	public abstract List findByhql(String hql);
	
	public abstract List  findByPage(String hql,int currentPage);
	
	public abstract List  findByPage(String hql,int currentPage,int total);
	
	public abstract List  findBysql(String sql);
	
	public abstract List  findBysqlPage(String sql,int currentPage);
	
	public abstract void delete(String hql);
	
	public Object getObj(Class  cls,int id);
	
	public Object getObj(Class  cls,long id);
	
}
