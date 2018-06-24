package com.trade.pojo;

import java.util.Date;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private String orderPost;
	private Product product;
	private double price;
	private double yj;
	private double shippingJe;
	private Integer amount;
	private Integer receiverId;
	private Integer userId;
	private Date createTime;
	private String status;
	private String size;
	private String gg;
	private String expNo;
	private String expNm;
	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Integer id) {
		this.id = id;
	}


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrderPost() {
		return orderPost;
	}

	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public double getYj() {
		return yj;
	}

	public void setYj(double yj) {
		this.yj = yj;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getExpNo() {
		return expNo;
	}

	public void setExpNo(String expNo) {
		this.expNo = expNo;
	}

	public String getExpNm() {
		return expNm;
	}

	public void setExpNm(String expNm) {
		this.expNm = expNm;
	}

	/**
	 * @return the shippingJe
	 */
	public double getShippingJe() {
		return shippingJe;
	}

	/**
	 * @param shippingJe the shippingJe to set
	 */
	public void setShippingJe(double shippingJe) {
		this.shippingJe = shippingJe;
	}

	
}