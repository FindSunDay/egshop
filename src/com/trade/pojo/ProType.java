package com.trade.pojo;

import java.util.Date;

/**
 * Role entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ProType implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String userName;
	private Date createTime;
	private String parent;

	// Constructors

	/** default constructor */
	public ProType() {
	}

	/** minimal constructor */
	public ProType(Integer id) {
		this.id = id;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

}