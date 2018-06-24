package com.trade.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.trade.common.Constants;
import com.trade.pojo.Order;
import com.trade.pojo.Product;
import com.trade.pojo.Receiver;
import com.trade.pojo.Reviews;
import com.trade.pojo.User;
import com.trade.service.MessageService;
import com.trade.service.OrderService;
import com.trade.service.ShopCart;
import com.trade.service.UserService;
 
public class OrderAction extends BaseAction{
	private int receiverId;
	private Receiver receiver;
	private OrderService orderService;
	private String orderPost;
	private String totalPrice;
	private List<Order> orderList;
	private String title;
	private Reviews reviews;
	private Long id;
	private Product product;
	private String startDate;
	private String endDate;
	private List<Product> productList;
	private UserService userService;
	private MessageService messageService;
	private String result;
	private Order order;
	public String carOrder(){
		User user=(User) session.get(Constants.loginUser);
		receiver=orderService.getReceiverObj(user.getId());
		return SUCCESS;
	}

	public String saveReceiver(){
		User user=(User) session.get(Constants.loginUser);
		receiver.setCreateTime(new Date());
		receiver.setUserId(user.getId());
		orderService.saveReciver(receiver);
		return SUCCESS;
	}
	
	public String orderSuccess(){
		
		return SUCCESS;
	}
	
	
	public String orderInfoStatu(){
		return result;
	}
	
	
	public String ordeZhif(){
		User user=(User) session.get(Constants.loginUser);
		User userNew=userService.getUserObj(user.getId());
		if(userNew.getMoney()==null){
			return ERROR;
		}
		BigDecimal pay=userNew.getMoney().subtract(new BigDecimal(totalPrice));
		if(pay.compareTo(new BigDecimal(0))<0){
			return ERROR;
		}
		userNew.setMoney(pay);
		//积分累计
		if(userNew.getIntegral()==null) {
			userNew.setIntegral(new BigDecimal(totalPrice));
		} else {
			userNew.setIntegral(userNew.getIntegral().add(new BigDecimal(totalPrice)));
		}
		
		userService.updateUser(userNew);
		orderService.updateOrderPost(orderPost);
		session.put(Constants.loginUser, userNew);
		return SUCCESS;
	}
	public String productReview(){
		product=orderService.getProductObj(id);
		return SUCCESS;
	}
	
	public String saveReviews(){
		try{
		User user=(User) session.get(Constants.loginUser);
		reviews.setCreateTime(new Date());
		reviews.setProductId(id);
		reviews.setUserName(user.getName());
		orderService.saveReviews(reviews);
		response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String saveOrder(){
		User user=(User) session.get(Constants.loginUser);
		 orderPost=new Date().getTime()+"";
		ShopCart car=(ShopCart) session.get("car");
		 Collection<Product>  pros=car.getItems();
		 double tp = 0;
		 for(Product product:pros){
			 Order order=new Order();
			 order.setAmount(product.getAmount());
			 order.setOrderPost(orderPost);
			 order.setCreateTime(new Date());
			 order.setPrice(/*product.getGg().getPrice()*/product.getNewPrice());
//			 order.setGg(product.getGg().getName());
			 order.setYj(product.getNewPrice()*product.getAmount());
			 order.setShippingJe(car.getShippingJe().doubleValue());
			 order.setProduct(product);
			 order.setUserId(user.getId());
			 order.setReceiverId(receiverId);
			 order.setSize(product.getSize());
			 order.setStatus("未付款");
			 orderService.saveOrder(order);
			 tp = tp + order.getPrice()*order.getAmount();
			 //totalPrice= new BigDecimal((order.getPrice()*order.getAmount()+order.getShippingJe()-car.getShippingJe().doubleValue())).setScale(2, BigDecimal.ROUND_HALF_UP)+"";
		 } 
		 totalPrice = new BigDecimal((tp+car.getShippingJe().doubleValue()-car.getCouponJe().doubleValue())).setScale(2, BigDecimal.ROUND_HALF_UP)+"";
		 setTotalPrice(totalPrice);
		 if(user!=null&& user.getCoupon()!=null) {
			 user.setCoupon(user.getCoupon()-1);
			 if(user.getCoupon()<0) {
				 user.setCoupon(0);
			 }
			 userService.updateUser(user);
		 }
		 session.remove("car");
		 return SUCCESS;
	}
	
	public String myOrderList(){
		try {
			User user=(User) session.get(Constants.loginUser);
			totalCount=orderService.countMyOrder(user.getId());
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
		    orderList=orderService.getMyOrderList(user.getId(), getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateOrder(){
		try {
			orderService.updateOrder(receiverId,orderPost);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String orderJhInit(){
		
		return SUCCESS;
	}
	
	public String updateOrderJh(){
		try {
			orderService.updateOrderJh(order);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String orderSh(){
		 order=orderService.getOrderObj(receiverId);
		return SUCCESS;
	}
	
	public String orderShSure(){
		
		try {
			order=orderService.getOrderObj(receiverId);
			User usernew=userService.getUserObj(order.getUserId());
			orderService.updateOrder(order.getId(),orderPost);
			usernew.setMoney(usernew.getMoney().add(new BigDecimal(totalPrice)));
			userService.updateUser(usernew);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getOrderManage(){
		try {
			totalCount=orderService.countOrderTotal(title);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
		    orderList=orderService.getOrderList(title,getCurrentPage());
		    messageService.addMessage("管理员查看【订单管理】");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getOrderTotalMange(){
		try {
			totalCount=orderService.countOrderTotal(title, startDate, endDate);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
		   productList=orderService.getOrderTotalList(title, startDate, endDate, getCurrentPage());
		   totalPrice=orderService.getTotalOrderPrice();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteOrder(){
		try {
			orderService.deleteOrder(ids);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Receiver getReceiver() {
		return receiver;
	}

	public void setReceiver(Receiver receiver) {
		this.receiver = receiver;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public String getOrderPost() {
		return orderPost;
	}

	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Reviews getReviews() {
		return reviews;
	}

	public void setReviews(Reviews reviews) {
		this.reviews = reviews;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	/**
	 * @return the messageService
	 */
	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * @param messageService the messageService to set
	 */
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}




	
	
}
