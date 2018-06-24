package com.trade.pojo;



/**
 * JGys entity. @author MyEclipse Persistence Tools
 */

public class Gg implements java.io.Serializable {

	// Fields

	private Long id;
	private Long goodsId;
	private String name;
	private double price;
	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

}