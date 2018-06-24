package com.trade.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.ProType;
import com.trade.pojo.Product;
import com.trade.pojo.Reviews;
import com.trade.util.Array;


public class ProductService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveProduct(Product product){
		baseDao.save(product);
	}
	public void updateProduct(Product product){
		baseDao.update(product);
	}
	public Product getProductObj(long id){
		return (Product) baseDao.getObj(Product.class, id);
	}
	
	public long getProductScore(long productId){
		String hql="select sum(level)/count(id) from Reviews where productId="+productId;
		Long count= baseDao.countByhql(hql);
		if(count==null){
			return 0;
		}
		return count;
	} 
	
	public long countProduct(String title,String typeName,String minPrice,String maxPrice){
		String hql="select count(id) from Product where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and title like '%"+title.trim()+"%'";
		}
		if(typeName!=null&&!"".equals(typeName)){
			hql+=" and proType.name like '%"+typeName.trim()+"%'";
		}
		if(minPrice!=null&&!"".equals(minPrice)){
			hql+=" and newPrice >="+minPrice.trim();
		}
		if(maxPrice!=null&&!"".equals(maxPrice)){
			hql+=" and newPrice <="+maxPrice.trim();
		}
		return baseDao.countByhql(hql);
	} 
	
	public List<Product> getProductList(String title,String typeName,String minPrice,String maxPrice,int currentPage){
		String hql="from Product where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and title like '%"+title.trim()+"%'";
		}
		if(typeName!=null&&!"".equals(typeName)){
			hql+=" and proType.name like '%"+typeName.trim()+"%'";
		}
		if(minPrice!=null&&!"".equals(minPrice)){
			hql+=" and newPrice >="+minPrice.trim();
		}
		if(maxPrice!=null&&!"".equals(maxPrice)){
			hql+=" and newPrice <="+maxPrice.trim();
		}
		hql+="  order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public void deleteProduct(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from Product where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
	public void updateProductHot(String[] ids,String isHot){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="";
			if("1".equals(isHot)){
				hql="update Product set hot='1' where id in("+id+")";
			}else{
				hql="update Product set hot='0' where id in("+id+")";
			}
			baseDao.delete(hql);
		}
	}
	
	public void saveProType(ProType proType){
		baseDao.save(proType);
	}
	public void updateProType(ProType proType){
		baseDao.update(proType);
	}
	public ProType getProTypeObj(int id){
		return (ProType) baseDao.getObj(ProType.class, id);
	}
	
	public long countProType(String name){
		String hql="select count(id) from ProType where 1=1";
		if(name!=null&&!"".equals(name)){
			hql+=" and name like '%"+name.trim()+"%'";
		}
		return baseDao.countByhql(hql);
	} 
	
	public List<ProType> getProTypeList(String name,int currentPage){
		String hql="from ProType where 1=1";
		if(name!=null&&!"".equals(name)){
			hql+=" and   name like '%"+name.trim()+"%'";
		}
		hql+=" order by  createTime desc";
		return baseDao.findByPage(hql, currentPage);
		
	}
	
	public List<ProType> getProTypeList(){
		String hql="from ProType";
		return baseDao.findByhql(hql);
	}

	public void deleteProType(String[] ids){
		if(ids!=null){
			String id=Array.arrayToString(ids);
			String hql="delete from ProType where id in("+id+")";
			baseDao.delete(hql);
		}
	}
	
	public List<Product> findProductTopList(int total){
		String hql="from Product where hot='1' order by createTime desc";
		return baseDao.findByPage(hql, 1, total);
		
	}
	public List<Product> findProductByType(int typeId,int total){
		String hql="from Product where proType.id="+typeId+" order by createTime desc";
		return baseDao.findByPage(hql, 1, total);
	}
	
	public long countProductFront(String title,String typeId,String minPrice,String maxPrice){
		String hql="select count(id) from Product where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and (title like '%"+title.trim()+"%' or keyWords like '%" +title.trim()+ "%') ";
		}
		if(typeId!=null&&!"".equals(typeId)){
			hql+=" and proType.id ="+typeId.trim();
		}
		if(minPrice!=null&&!"".equals(minPrice)){
			hql+=" and newPrice >="+minPrice.trim();
		}
		if(maxPrice!=null&&!"".equals(maxPrice)){
			hql+=" and newPrice <="+maxPrice.trim();
		}
		return baseDao.countByhql(hql);
	} 
	
	
	public List<Product> getProductListFront(String title,String typeId,String minPrice,String maxPrice,int currentPage){
		String hql="from Product where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and (title like '%"+title.trim()+"%' or keyWords like '%" +title.trim()+ "%') ";
		}
		if(typeId!=null&&!"".equals(typeId)){
			hql+=" and proType.id= "+typeId.trim();
		}
		if(minPrice!=null&&!"".equals(minPrice)){
			hql+=" and newPrice >="+minPrice.trim();
		}
		if(maxPrice!=null&&!"".equals(maxPrice)){
			hql+=" and newPrice <="+maxPrice.trim();
		}
			hql+="  order by createTime desc";
		return baseDao.findByPage(hql, currentPage, 20);
	}
	
	public long countReviews(long proId){
		String hql="select count(id) from Reviews where productId="+proId;
		return baseDao.countByhql(hql);
		
	}
	
	public List<Reviews> getReviewsList(long proId,int currentPage){
		String hql="from Reviews where productId="+proId+"order by createTime";
		return baseDao.findByPage(hql, currentPage);
	}
	
	
	public List<Product> getMyLoveProductList(){
		String sql="select t.id,t.title,t.old_Price,t.new_Price,t.hot,t.image,o.total from product t,(SELECT SUM(amount) total,product_id,create_time FROM t_order where 1=1";
		sql+=" GROUP BY product_id) o where t.id=o.product_id order by total desc";
		List<Object[]> list=baseDao.findBysqlPage(sql, 1);
		List<Product> proList=new ArrayList<Product>();
		for(int i=0;i<list.size();i++){
			if(i>5){
				break;
			}
			Object[] obj=list.get(i);
			Product product=new Product();
			product.setId(Long.parseLong(obj[0].toString()));
			product.setTitle(obj[1].toString());
			product.setOldPrice(Double.parseDouble(obj[2].toString()));
			product.setNewPrice(Double.parseDouble(obj[3].toString()));
			product.setHot(obj[4].toString());
			product.setImage(obj[5].toString());
			proList.add(product);
		}
		return proList;
	}
}
