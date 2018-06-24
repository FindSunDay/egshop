package com.trade.service;

import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.Collect;


public class CollectService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveCollect(Collect collect){
		baseDao.save(collect);
	}
	
	public boolean isCollect(int userId,long id) {
		String hql=" from Collect where userId="+userId + " and product.id=" + id;
		 List<Collect> list = baseDao.findByPage(hql, 1);
		 if(list!=null && list.size()>0) {
			 return true;
		 } else {
			 return false;
		 } 
	}
	
	
	public long countMyCollect(int userId){
		String hql="select count(id) from Collect where userId="+userId;
		return baseDao.countByhql(hql);
	}

	public List<Collect> getMyCollectList(int userId,int currentPage){
		String hql=" from Collect where userId="+userId;
		return baseDao.findByPage(hql, currentPage);
	}
	
	public long countCollectTotal(){
		String hql="select count(id) from Collect ";
		return baseDao.countByhql(hql);
	}
	
	public List<Collect> getCollectList(int currentPage){
		String hql=" from Collect ";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteCollect(String[] ids){
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				Collect collect=(Collect) baseDao.getObj(Collect.class, Integer.parseInt(ids[i]));
				baseDao.delete(collect);
			}
		}
	}

	public Collect getCollectObj(Integer id){
		return (Collect) baseDao.getObj(Collect.class, id);
	}
	
}
