package com.trade.service;

import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.News;
import com.trade.pojo.Reviews;
import com.trade.util.Array;


public class ReviewsService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveReviews(Reviews reviews){
		baseDao.save(reviews);
	}
	public void updateReviews(Reviews reviews){
		baseDao.update(reviews);
	}
	public Reviews getReviewsObj(int id){
		return (Reviews) baseDao.getObj(Reviews.class, id);
	}
	
	public long countReviews(String content){
		String hql="select count(id) from Reviews where 1=1";
//		if(content!=null&&!"".equals(content)){
//			hql+=" and content like '%"+content.trim()+"%'";
//		}
		return baseDao.countByhql(hql);
	} 
	
	public List<Reviews> getReviewsList(String content,int currentPage){
		String hql="from Reviews where  1=1";
//		if(content!=null&&!"".equals(content)){
//			hql+=" and content like '%"+content.trim()+"%'";
//		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteReviews(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from Reviews where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
}
