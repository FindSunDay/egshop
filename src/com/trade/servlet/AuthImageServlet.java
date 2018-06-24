package com.trade.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trade.util.VerifyCodeUtils;

public class AuthImageServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		request.getSession(true).setAttribute("authCode", verifyCode);
		int w=80,h=28;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);	
	}

}
