package com.trade.pojo;



/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Collect implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Product product;
	private Integer userId;
	// Constructors

	/** default constructor */
	public Collect() {
	}

	/** minimal constructor */
	public Collect(Integer id) {
		this.id = id;
	}


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}


	
}