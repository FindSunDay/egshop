package com.trade.pojo;

/**
 * RoleMenu entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class RoleMenu implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roleId;
	private Integer menuId;

	// Constructors

	/** default constructor */
	public RoleMenu() {
	}

	/** minimal constructor */
	public RoleMenu(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public RoleMenu(Integer id, Integer roleId, Integer menuId) {
		this.id = id;
		this.roleId = roleId;
		this.menuId = menuId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return this.menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

}