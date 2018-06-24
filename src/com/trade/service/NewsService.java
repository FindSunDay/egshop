package com.trade.service;

import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.News;
import com.trade.util.Array;


public class NewsService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveNews(News news){
		baseDao.save(news);
	}
	public void updateNews(News news){
		baseDao.update(news);
	}
	public News getNewsObj(int id){
		return (News) baseDao.getObj(News.class, id);
	}
	
	public List<News> getNewsListTop(int total){
		String hql="from News order by createTime desc";
		return baseDao.findByPage(hql, 1, total);
	}
	
	public long countNews(String title){
		String hql="select count(id) from News where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and title like '%"+title.trim()+"%'";
		}
		return baseDao.countByhql(hql);
	} 
	
	public List<News> getNewsList(String title,int currentPage){
		String hql="from News where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and title like '%"+title.trim()+"%'";
		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteNews(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from News where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
}
