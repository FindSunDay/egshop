package com.trade.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;



import com.trade.dao.BaseDao;
import com.trade.pojo.JGys;
import com.trade.util.Array;

public class GYSService {
	private BaseDao baseDao;
	
	public void saveGys(JGys jgys){
		baseDao.save(jgys);
	}
	
	 
	public void updateGys(JGys jgys){
		baseDao.update(jgys);
	}
	public JGys getGysObj(int id){
		return (JGys) baseDao.getObj(JGys.class, id);
	}
	
	public long countGys(Integer state){
		String hql="select count(id) from JGys where 1=1";
		
		if(state!=null){
			hql+=" and state="+state;
		}
		
		return baseDao.countByhql(hql);
	} 
	
	public List<JGys> getGysList(Integer state,int currentPage){
		String hql="from JGys where 1=1";
		if(state!=null){
			hql+=" and state="+state;
		}
		
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	 
	
	public void deleteGys(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from JGys where id in("+id+")";
			baseDao.delete(hql);
		}
	}


	public BaseDao getBaseDao() {
		return baseDao;
	}


	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
}
