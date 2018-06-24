package com.trade.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.trade.common.Constants;
import com.trade.pojo.Collect;
import com.trade.pojo.Order;
import com.trade.pojo.Product;
import com.trade.pojo.Receiver;
import com.trade.pojo.Reviews;
import com.trade.pojo.User;
import com.trade.service.CollectService;
import com.trade.service.MessageService;
import com.trade.service.OrderService;
import com.trade.service.ProductService;
import com.trade.service.ShopCart;
import com.trade.service.UserService;
 
public class CollectAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1677076843610362709L;
	private CollectService collectService;
	private List<Collect> collectList;
	private ProductService productService;
	private Long id;

	
	
	
	public String saveCollect(){
		User user=(User) session.get(Constants.loginUser);
		if(collectService.isCollect(user.getId(), id)) {
			return SUCCESS;
		}
		Product pro=productService.getProductObj(id);
		Collect collect=new Collect();
		collect.setUserId(user.getId());
		collect.setProduct(pro);
		collectService.saveCollect(collect);
		return SUCCESS;
	}
	
	public String myCollectList(){
		try {
			User user=(User) session.get(Constants.loginUser);
			totalCount=collectService.countMyCollect(user.getId());
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			collectList=collectService.getMyCollectList(user.getId(), getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String deleteCollect(){
		try {
			collectService.deleteCollect(ids);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the collectService
	 */
	public CollectService getCollectService() {
		return collectService;
	}

	/**
	 * @param collectService the collectService to set
	 */
	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}

	/**
	 * @return the collectList
	 */
	public List<Collect> getCollectList() {
		return collectList;
	}

	/**
	 * @param collectList the collectList to set
	 */
	public void setCollectList(List<Collect> collectList) {
		this.collectList = collectList;
	}

	/**
	 * @return the productService
	 */
	public ProductService getProductService() {
		return productService;
	}

	/**
	 * @param productService the productService to set
	 */
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	
	
}
