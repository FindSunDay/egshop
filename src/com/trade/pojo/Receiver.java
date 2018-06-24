package com.trade.pojo;

import java.util.Date;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Receiver implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String address;
	private String phone;
	private String post;
	private Integer userId;
	private Date createTime;
	
	// Constructors

	/** default constructor */
	public Receiver() {
	}

	/** minimal constructor */
	public Receiver(Integer id) {
		this.id = id;
	}


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

}