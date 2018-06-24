package com.trade.service;

import java.math.BigDecimal;
import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.Gg;
import com.trade.pojo.Menu;
import com.trade.pojo.Role;
import com.trade.pojo.RoleMenu;
import com.trade.util.Array;


public class GgService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveGg(Gg gg){
		this.baseDao.save(gg);
	}
	
	public void updateGg(Gg gg){
		this.baseDao.update(gg);
	}
	
	public Gg getGgObj(long id){
		return (Gg) baseDao.getObj(Gg.class,id);
	}
	
	 
	
	public List<Gg> getGgList(long goodsId){
		String hql="from Gg where goodsId="+goodsId;
		return baseDao.findByhql(hql);
	}
	
	public void deleteGg(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from Gg where id in("+id+")";
			baseDao.delete(hql);
		}
	}	
}
