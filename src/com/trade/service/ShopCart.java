package com.trade.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.trade.common.Constants;
import com.trade.pojo.Product;
import com.trade.pojo.User;



public class ShopCart {
	
	private User user;

	private Map<Long, Product> map=new HashMap<Long, Product>();
	
	public Map<Long, Product> addProduct(Product product){
		if(map.get(product.getId())==null){
			map.put(product.getId(),product);
		}else{
			Product p=map.get(product.getId());
			p.setAmount(p.getAmount()+product.getAmount());
			map.put(p.getId(),p);
		}
		return map;
	}
	
//	查找所有商品
	public Collection getItems(){
		return  map.values();
	}
	//商品总价
	public BigDecimal getTotalPrice(){
		BigDecimal amount=new BigDecimal(0);
		Iterator<Long> it=map.keySet().iterator();
		while(it.hasNext()){
			Long id=it.next();
			Product p =map.get(id);
			amount=amount.add(new BigDecimal(/*p.getGg().getPrice()*/p.getNewPrice()*p.getAmount()));
		}
		
		return amount;
		
	}
	
	//邮费
	public BigDecimal getShippingJe(){
		BigDecimal shippingJe=new BigDecimal(12);
		if(getTotalPrice().doubleValue()>=80) { 
			shippingJe=new BigDecimal(0);
		}
		return shippingJe;
	}
	
	//使用优惠券提示
	public String getUsecoupon() {
		if(user!=null) {
			if(user.getCoupon()!=null && user.getCoupon()>0) {
				return "剩余:"+user.getCoupon()+"张，一次可用一张，可抵扣￥";
			}
		}
		return "无，可抵扣￥";
	}
	
	//抵扣金额
	public BigDecimal getCouponJe() {
		if(user!=null) {
			if(user.getCoupon()!=null && user.getCoupon()>0) {
				return getTotalPrice().multiply(new BigDecimal(0.02).setScale(2,RoundingMode.HALF_UP));
			}
		}
		return new BigDecimal(0);
	}
	
	//商品总价
		public BigDecimal getTotalYj(){
			BigDecimal amount=new BigDecimal(0);
			Iterator<Long> it=map.keySet().iterator();
			while(it.hasNext()){
				Long id=it.next();
				Product p =map.get(id);
				amount=amount.add(new BigDecimal(/*(p.getGg().getPrice()*2)*/p.getNewPrice()*p.getAmount()));
			}
			
			return amount;
			
		}
	//商品总数量
	public int getCountTotal(){
		int count=0;
		Iterator<Long> it=map.keySet().iterator();
		while(it.hasNext()){
			Long id=it.next();
		     Product p=map.get(id);
			count+=p.getAmount();
		}
		return count;
	}
	
	public void deleteCar(long id){
		map.remove(id);
	}
	
	public void deleteAll(){
		map.clear();
	}
	
	public void modify(Long id,int amount){
		if(map.get(id)!=null){
			Product p=map.get(id);
			p.setAmount(amount);
			map.put(id, p);
		}
	}
	
	/**
	 * @return the freeShipping
	 */
	public String getFreeShipping() {
		if(getTotalPrice().doubleValue()>=80) { 
			return  "(满80包邮)";
		} else {
			return "";
		}
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
