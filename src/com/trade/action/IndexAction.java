package com.trade.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.trade.pojo.News;
import com.trade.pojo.ProType;
import com.trade.pojo.Product;
import com.trade.service.NewsService;
import com.trade.service.OrderService;
import com.trade.service.ProductService;

import net.sf.json.JSONObject;


public class IndexAction extends BaseAction{

	private ProductService productService;
	private NewsService newsService;
	private OrderService orderService;
	
	public String getNewsTop(){
		response.setCharacterEncoding("utf-8");
		try{
		List<News> list=newsService.getNewsListTop(10);
		JSONObject json=new JSONObject();
		json.put("newsList", list);
		response.getWriter().write(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
		return null;
	}
	
	public String getGGList(){
		response.setCharacterEncoding("utf-8");
		try{
		List<News> list=newsService.getNewsListTop(999);
		JSONObject json=new JSONObject();
		json.put("ggList", list);
		response.getWriter().write(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
		return null;
	}
	
	
	
	public String getSellProductsTop(){
		response.setCharacterEncoding("utf-8");
		try{
		JSONObject json=new JSONObject();
		json.put("newsList", orderService.getProductsListTop(10));
		response.getWriter().write(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
		return null;
	}
	
	public String getNewProductTop(){
		try {
		response.setCharacterEncoding("utf-8");
		List<Product> list=productService.findProductTopList(5);
		JSONObject json=new JSONObject();
		json.put("productList", list);
		response.getWriter().write(json.toString());
	} catch (Exception e) {
		e.printStackTrace();
	}
		return null;
	}

	public String productListByType(){
		try {
			response.setCharacterEncoding("utf-8");
			List<ProType> list=productService.getProTypeList();
			List<Product> productList=new ArrayList<Product>();
			for(int i=0;i<list.size();i++){
				ProType type=list.get(i);
			    List<Product> pList=productService.findProductByType(type.getId(),5);
			    productList.addAll(pList);
			}
			JSONObject json=new JSONObject();
			json.put("menuList", list);
			json.put("productList", productList);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	/**
	 * @return the orderService
	 */
	public OrderService getOrderService() {
		return orderService;
	}

	/**
	 * @param orderService the orderService to set
	 */
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	
	
}
