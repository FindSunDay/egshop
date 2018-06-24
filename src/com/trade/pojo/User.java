package com.trade.pojo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * User entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String account;
	private String psw;
	private String name;
	private Integer roleId;
	private Date createTime;
	private String email;
	private BigDecimal money;
	private BigDecimal integral;
	private Integer coupon;
	private String memberLevel;
	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public User(Integer id, String account, String psw, String name,
			Integer roleId) {
		this.id = id;
		this.account = account;
		this.psw = psw;
		this.name = name;
		this.roleId = roleId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPsw() {
		return this.psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	/**
	 * @return the integral
	 */
	public BigDecimal getIntegral() {
		return integral;
	}

	/**
	 * @param integral the integral to set
	 */
	public void setIntegral(BigDecimal integral) {
		this.integral = integral;
	}
	
	

	/**
	 * @return the coupon
	 */
	public Integer getCoupon() {
		return coupon;
	}

	/**
	 * @param coupon the coupon to set
	 */
	public void setCoupon(Integer coupon) {
		this.coupon = coupon;
	}

	/**
	 * @return the memberLevel
	 */
	public String getMemberLevel() {
		memberLevel = "青铜(0-1000积分)";
		if(integral!=null) {
			if (integral.longValue() >= 1001 && integral.longValue() <= 5000) {
				memberLevel = "白银(1001-5000积分)";
			} else if (integral.longValue() >= 5001 && integral.longValue() <= 10000) {
				memberLevel = "黄金(5001-10000积分)";
			} else if (integral.longValue() >= 10001) {
				memberLevel = "钻石(10000以上积分)";
			}
		}
		
		return memberLevel;
	}

	
}