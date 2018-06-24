package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import com.trade.common.Constants;
import com.trade.pojo.Gg;
import com.trade.pojo.ProType;
import com.trade.pojo.Product;
import com.trade.pojo.Reviews;
import com.trade.pojo.User;
import com.trade.service.GgService;
import com.trade.service.MessageService;
import com.trade.service.OrderService;
import com.trade.service.ProductService;


public class ProductAction extends BaseAction{

	private long id;
	private String title;
	private Product product;
	private ProType proType;
	private ProductService productService;
	private MessageService messageService;
	private List<ProType> proTypeList;
	private List<Product> productList;
	private String typeName;
	private List<Reviews> reviewsList;
	private String minPrice;
	private String maxPrice;
	private long score;
	private String isHot;
	private List<Gg> ggList;
	private Gg gg;
	private GgService ggService;
	private OrderService orderService;
	private long donedGroupNum;
	
	public String getMenuParent(){
		try {
			response.setCharacterEncoding("utf-8");
			List<ProType> list=productService.getProTypeList();
			JSONObject json=new JSONObject();
			json.put("menuList", list);
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String initProduct(){
		proTypeList=productService.getProTypeList();
		return SUCCESS;
	}
	
	public  String addProType(){
		try {
			User user=(User) session.get(Constants.loginUser);
			proType.setUserName(user.getName());
			proType.setCreateTime(new Date());
			productService.saveProType(proType);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public  String addProduct(){
		try {
			User user=(User) session.get(Constants.loginUser);
			product.setId(new Date().getTime());
			product.setCreateTime(new Date());
			product.setUserId(user.getId());
			product.setHot("0");
			productService.saveProduct(product);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String getProTypeObj(){
		proType=productService.getProTypeObj(((Long)id).intValue());
		return SUCCESS;
	}
	
	public String getProductObj(){
		product=productService.getProductObj(id);
		proTypeList=productService.getProTypeList();
		return SUCCESS;
	}
	
	public  String updateProType(){
		try {
			productService.updateProType(proType);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public  String updateProduct(){
		try {
			productService.updateProduct(product);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getProTypeManage(){
		try {
			totalCount=productService.countProType(title);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			proTypeList=productService.getProTypeList(title, getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String productInit(){
		return SUCCESS;
	}
	
	public String getProductManage(){
		try {
			totalCount=productService.countProduct(title,typeName,minPrice,maxPrice);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			productList=productService.getProductList(title,typeName,minPrice,maxPrice, getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	


	public String deleteProType(){
		try {
			productService.deleteProType(ids);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String deleteProduct(){
		try {
			productService.deleteProduct(ids);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String hotProduct(){
		try {
			productService.updateProductHot(ids, isHot);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public String productListByFront(){
		try {
			totalCount=productService.countProductFront(title, typeName,minPrice,maxPrice);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			productList=productService.getProductListFront(title,typeName,minPrice,maxPrice, getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String productLook(){
		try{
		product=productService.getProductObj(id);
		score=productService.getProductScore(id);
		totalCount=productService.countReviews(product.getId());
		pageCount = (totalCount - 1) / Constants.TotalPage + 1;
		if (super.getCurrentPage() > pageCount) {
			super.setCurrentPage(Long.valueOf(pageCount).intValue());
		}
		reviewsList=productService.getReviewsList(product.getId(), getCurrentPage());
		productList=productService.getMyLoveProductList();
		ggList=ggService.getGgList(id);
		donedGroupNum=orderService.countDonedGroupNum(product.getId());
		
		messageService.addMessage("管理员查看【商品管理】");
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String initGg(){
		
		return SUCCESS;
	}
	
	public String getGgObj(){
		gg=ggService.getGgObj(id);
		return SUCCESS;
	}
	
	public String saveGg(){
		try {
			ggService.saveGg(gg);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String getGgsList(){
		try {
			ggList=ggService.getGgList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateGg(){
		try {
			ggService.updateGg(gg);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String deleteGg(){
		try {
			ggService.deleteGg(ids);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProType getProType() {
		return proType;
	}

	public void setProType(ProType proType) {
		this.proType = proType;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<ProType> getProTypeList() {
		return proTypeList;
	}

	public void setProTypeList(List<ProType> proTypeList) {
		this.proTypeList = proTypeList;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public List<Reviews> getReviewsList() {
		return reviewsList;
	}

	public void setReviewsList(List<Reviews> reviewsList) {
		this.reviewsList = reviewsList;
	}

	public long getScore() {
		return score;
	}

	public void setScore(long score) {
		this.score = score;
	}

	public String getIsHot() {
		return isHot;
	}

	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}

	public String getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}

	public String getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}

	public List<Gg> getGgList() {
		return ggList;
	}

	public void setGgList(List<Gg> ggList) {
		this.ggList = ggList;
	}

	public Gg getGg() {
		return gg;
	}

	public void setGg(Gg gg) {
		this.gg = gg;
	}

	public GgService getGgService() {
		return ggService;
	}

	public void setGgService(GgService ggService) {
		this.ggService = ggService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public long getDonedGroupNum() {
		return donedGroupNum;
	}

	public void setDonedGroupNum(long donedGroupNum) {
		this.donedGroupNum = donedGroupNum;
	}

	/**
	 * @return the messageService
	 */
	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * @param messageService the messageService to set
	 */
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	

}
