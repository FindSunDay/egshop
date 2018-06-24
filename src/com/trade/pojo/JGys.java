package com.trade.pojo;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * JGys entity. @author MyEclipse Persistence Tools
 */

public class JGys implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String sex;
	private java.util.Date createTime;
	private String phone;
	private Integer cardNum;
	private String email;
	private Integer yearId;
	private String state;
	private String txm;
	private String zjlx;


	// Constructors

	public String getTxm() {
		return txm;
	}


	public void setTxm(String txm) {
		this.txm = txm;
	}


	public String getZjlx() {
		return zjlx;
	}


	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}





	/** default constructor */
	public JGys() {
	}


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	
	public java.util.Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(java.util.Date date) {
		this.createTime = date;
	}


	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getCardNum() {
		return this.cardNum;
	}

	public void setCardNum(Integer cardNum) {
		this.cardNum = cardNum;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getYearId() {
		return this.yearId;
	}

	public void setYearId(Integer yearId) {
		this.yearId = yearId;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}