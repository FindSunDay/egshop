package com.trade.pojo;

import java.util.Date;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String image;
	private String content;
	private ProType proType;
	private String size;
	private double oldPrice;
	private double newPrice;
	private int groupNum;
	private Integer userId;
	private Date createTime;
	private int amount;
	private String hot;
	private int stock;
	private String keyWords; 
	private String businessMail; 
	// Constructors
	private Gg gg;
	/** default constructor */
	public Product() {
	}


	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public ProType getProType() {
		return proType;
	}

	public void setProType(ProType proType) {
		this.proType = proType;
	}

	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(double oldPrice) {
		this.oldPrice = oldPrice;
	}

	public double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(double newPrice) {
		this.newPrice = newPrice;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getHot() {
		return hot;
	}

	public void setHot(String hot) {
		this.hot = hot;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}


	public Gg getGg() {
		return gg;
	}


	public void setGg(Gg gg) {
		this.gg = gg;
	}


	/**
	 * @return the groupNum
	 */
	public int getGroupNum() {
		return groupNum;
	}


	/**
	 * @param groupNum the groupNum to set
	 */
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}


	/**
	 * @return the keyWords
	 */
	public String getKeyWords() {
		return keyWords;
	}


	/**
	 * @param keyWords the keyWords to set
	 */
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}


	/**
	 * @return the businessMail
	 */
	public String getBusinessMail() {
		return businessMail;
	}


	/**
	 * @param businessMail the businessMail to set
	 */
	public void setBusinessMail(String businessMail) {
		this.businessMail = businessMail;
	}
	
	
	
}