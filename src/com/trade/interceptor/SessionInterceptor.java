package com.trade.interceptor;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.trade.common.Constants;
import com.trade.pojo.User;

public class SessionInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		if(!ServletActionContext.getRequest().isRequestedSessionIdValid()){
			return Action.LOGIN;
		}
		 User user= (User) invocation.getInvocationContext().getSession().get(Constants.loginUser);
		 if(user==null){
			 return Action.LOGIN;
		 }
		return invocation.invoke();
	}


	

}
