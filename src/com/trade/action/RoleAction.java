package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.pojo.Menu;
import com.trade.pojo.Role;
import com.trade.pojo.User;
import com.trade.service.RoleService;

import net.sf.json.JSONObject;


public class RoleAction extends BaseAction{

	private RoleService roleService;
	private String name;
	private List<Role> roleList;
	private Role role;
	private int id;
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	public List<Role> getRoleList() {
		return roleList;
	}
	public String getRoleManage(){
		try {
			totalCount=roleService.countRole(name);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			roleList=roleService.getRoleList(name, getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String addRole(){
		try {
			role.setCreateTime(new Date());
			roleService.saveRole(role);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getRoleObj(){
		role=roleService.getRoleObj(id);
		return SUCCESS;
	}
	
	public String updateRole(){
		try {
			roleService.updateRole(role);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getMenuByRole(){
		try {
			response.setCharacterEncoding("utf-8");
			User user=(User) session.get(Constants.loginUser);
			List<Menu> list=roleService.getMenuList(user.getRoleId());
			JSONObject json=new JSONObject();
			json.put("menu", list);
			response.getWriter().write(json.toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String deleteRole(){
		try {
			roleService.deleteRole(ids);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String selectRoleMenu(){
		try {
			response.setCharacterEncoding("utf-8");
			List<Menu> selectMenu=roleService.getSelectMenu(id);
			List<Menu> noSelectMenu=roleService.getNoSelectMenu(id);
			JSONObject json=new JSONObject();
			json.put("selectMenu", selectMenu);
			json.put("noSelectMenu", noSelectMenu);
			response.getWriter().write(json.toString());
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String initRoleMenu(){
		return SUCCESS;
	}
	
	public String addRoleMenu(){
			try {
				roleService.saveRoleMenu(id, ids);
				response.getWriter().write("success");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
	}
	
	public String updateBatchRole(){
		try {
			roleService.updateBatchRole(role.getInitPrice());
		  ((Role) session.get("userRole")).setInitPrice(role.getInitPrice());
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
