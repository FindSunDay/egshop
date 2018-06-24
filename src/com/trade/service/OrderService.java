package com.trade.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.trade.dao.BaseDao;
import com.trade.pojo.Order;
import com.trade.pojo.Product;
import com.trade.pojo.Receiver;
import com.trade.pojo.Reviews;

public class OrderService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void saveOrder(Order order){
		baseDao.save(order);
		order.getProduct().setStock(order.getProduct().getStock()-order.getAmount());
		baseDao.update(order.getProduct());
	}
	
	public Receiver saveReciver(Receiver receiver){
		if(receiver.getId()!=null){
			baseDao.update(receiver);
		}else{
			baseDao.save(receiver);
		}
		return receiver;
	}
	
	public Product getProductObj(long id){
		return (Product) baseDao.getObj(Product.class,id);
	}
	
	
	public void saveReviews(Reviews reviews){
		baseDao.save(reviews);
	}
	public void updateOrder(int id,String order){
		if("fh".equals(order)){
			String hql="update Order set status='已发货' where id="+id;
			baseDao.delete(hql);
		}else if("sh".equals(order)){
			String hql="update Order set status='已收货' where id="+id;
			baseDao.delete(hql);
		}else if("gh".equals(order)){
			String hql="update Order set status='已寄回' where id="+id;
			baseDao.delete(hql);
		}else if("qr".equals(order)){
			String hql="update Order set status='交易完成' where id="+id;
			baseDao.delete(hql);
		}
	}
	
	public void updateOrderJh(Order order){
		String hql="update Order set status='已寄回', expNo='"+order.getExpNo()+"', expNm='"+order.getExpNm()+"' where id="+order.getId();
		baseDao.delete(hql);
	}
	
	public Receiver getReceiverObj(int userId){
		String hql="from Receiver where userId="+userId;
		List<Receiver> list=baseDao.findByhql(hql);
		if(list!=null&&!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	
	public long countMyOrder(int userId){
		String hql="select count(id) from Order where userId="+userId;
		return baseDao.countByhql(hql);
	}
	
	public long countDonedGroupNum(long productId){
		String hql="select sum(amount) from Order where product.id="+productId;
		return baseDao.countByhql(hql);
	}
	
	public List<Order> getMyOrderList(int userId,int currentPage){
		String hql=" from Order where userId="+userId;
		return baseDao.findByPage(hql, currentPage);
	}
	
	public long countOrderTotal(String title){
		String hql="select count(id) from Order where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and  product.title like '%"+title.trim()+"%'";
		}
		return baseDao.countByhql(hql);
	}
	
	public List<Order> getOrderList(String title,int currentPage){
		String hql=" from Order where 1=1";
		if(title!=null&&!"".equals(title)){
			hql+=" and  product.title like '%"+title.trim()+"%'";
		}
		hql+=" order by createTime desc";
		return baseDao.findByPage(hql, currentPage);
	}
	
	public long countOrderTotal(String title,String startDate,String endDate){
		String hql="select count(id) from product t,(SELECT SUM(amount) total,product_id,create_time FROM t_order where 1=1";
		if(startDate!=null&&!"".equals(startDate)){
			hql+=" and  create_time >='"+startDate+" 00:00:00'";
		}
		if(endDate!=null&&!"".equals(endDate)){
			hql+=" and  create_time <='"+endDate+" 00:00:00'";
		}
		hql+=" GROUP BY product_id) o where t.id=o.product_id ";
		if(title!=null&&!"".equals(title)){
			hql+=" and  t.title like '%"+title.trim()+"%'";
		}
		return baseDao.countBysql(hql);
	}
	
	public List<Product> getOrderTotalList(String title,String startDate,String endDate,int currentPage){
		String hql="select t.id,t.title,o.total,o.create_time,o.allprice from product t,(SELECT SUM(amount) total,sum(amount*price) allprice,product_id,create_time FROM t_order where 1=1";
		if(startDate!=null&&!"".equals(startDate)){
			hql+=" and create_time >='"+startDate+" 00:00:00'";
		}
		if(endDate!=null&&!"".equals(endDate)){
			hql+=" and create_time <='"+endDate+" 00:00:00'";
		}
		hql+=" GROUP BY product_id) o where t.id=o.product_id ";
		if(title!=null&&!"".equals(title)){
			hql+=" and  t.title like '%"+title.trim()+"%'";
		}
		  hql+="order by total desc";
		List<Object[]> list=baseDao.findBysqlPage(hql,currentPage);
		List<Product> proList=new ArrayList<Product>();
		for(Object[] obj:list){
			Product product=new Product();
			product.setId(Long.parseLong(obj[0].toString()));
			product.setTitle(obj[1].toString());
			product.setAmount(Integer.parseInt(obj[2].toString()));
			product.setCreateTime((Date) obj[3]);
			product.setNewPrice(Double.parseDouble(obj[4].toString()));
			proList.add(product);
		}
		return proList;
	}
	
	public String getTotalOrderPrice(){
		String hql="select sum(amount*price) from Order";
		List list= baseDao.findByhql(hql);
		if(list!=null&&!list.isEmpty()){
			return  list.get(0).toString();
		}
		return "0";
	}
	
	public void deleteOrder(String[] ids){
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				Order order=(Order) baseDao.getObj(Order.class, Integer.parseInt(ids[i]));
				if("未付款".equals(order.getStatus())){
				order.getProduct().setStock(order.getProduct().getStock()+order.getAmount());
				baseDao.update(order.getProduct());
				}
				baseDao.delete(order);
			}
		}
	}
	
	public void updateOrderPost(String post){
		String hql=" update Order set status='已付款未发货' where orderPost='"+post+"'";
		baseDao.delete(hql);
	}
	
	
	public Order getOrderObj(Integer id){
		return (Order) baseDao.getObj(Order.class, id);
	}
	
	public List<Product> getProductsListTop(int total) {
		try {
		    String hql="select o.product from Order o group by o.product.id  order by sum(o.amount) desc";
		    return baseDao.findByPage(hql, 1, total);
		}catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
	}
	
}
