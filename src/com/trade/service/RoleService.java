package com.trade.service;

import java.math.BigDecimal;
import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.Menu;
import com.trade.pojo.Role;
import com.trade.pojo.RoleMenu;
import com.trade.util.Array;


public class RoleService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveRole(Role role){
		this.baseDao.save(role);
	}
	
	public void updateRole(Role role){
		this.baseDao.update(role);
	}
	
	public Role getRoleObj(int id){
		return (Role) baseDao.getObj(Role.class,id);
	}
	
	public long countRole(String name){
		String hql="select count(id) from Role";
		if(name!=null&&!"".equals(name)){
			hql+=" where name like '%"+name+"%'";
		}
		return baseDao.countByhql(hql);
	} 
	
	public List<Role> getRoleList(String name,int currentPage){
		String hql="from Role";
		if(name!=null&&!"".equals(name)){
			hql+=" where name like '%"+name+"%'";
		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteRole(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String rolehql="delete from Role where id in("+id+")";
			String roleMenuHql="delete from RoleMenu where role_id in ("+id+")";
			this.baseDao.delete(rolehql);
			this.baseDao.delete(roleMenuHql);
		}
	}
	
	public List<Menu> getSelectMenu(int id){
		String hql="from Menu where id in( select menuId from RoleMenu where roleId="+id+")";
		return baseDao.findByhql(hql);
	} 
	
	public List<Menu> getNoSelectMenu(int id){
		String hql="from Menu where id not in( select menuId from RoleMenu where roleId="+id+")";
		return baseDao.findByhql(hql);
	} 
	
	public List<Menu> getMenuList(int roleId){
		String hql="from Menu where id in(select menuId from RoleMenu where roleId="+roleId+")";
		return baseDao.findByhql(hql);
	}
	
	public void saveRoleMenu(int roleId,String[] ids){
		String hql="delete from RoleMenu where roleId="+roleId;
		baseDao.delete(hql);
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				RoleMenu rm=new RoleMenu();
				rm.setMenuId(Integer.parseInt(ids[i]));
				rm.setRoleId(roleId);
				baseDao.save(rm);
			}
		}
	}
	public void updateBatchRole(BigDecimal price){
		String hql="update Role set initPrice="+price;
		baseDao.delete(hql);
		 
	}
}
