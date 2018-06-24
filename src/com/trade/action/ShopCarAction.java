package com.trade.action;


import com.trade.common.Constants;
import com.trade.pojo.Gg;
import com.trade.pojo.Product;
import com.trade.pojo.User;
import com.trade.service.GgService;
import com.trade.service.ProductService;
import com.trade.service.ShopCart;


public class ShopCarAction extends BaseAction{

	private int amount;
	private long id;
	private String size;
	private int gg;
	private ProductService productService;
	private GgService ggService;
	public String shopcar(){
		return SUCCESS;
	}
	
	public String addProductCar(){
		Product pro=productService.getProductObj(id);
		Gg bean=ggService.getGgObj(gg);
		pro.setAmount(amount);
		pro.setSize(size);
		pro.setGg(bean);
		if(session.get("car")==null){
			ShopCart car=new ShopCart();
			car.addProduct(pro);
			session.put("car", car);
		}else{
			ShopCart car=(ShopCart) session.get("car");
			car.addProduct(pro);
		}
		ShopCart car=(ShopCart) session.get("car");
		car.setUser((User) session.get(Constants.loginUser));
		return SUCCESS;
	}
	
	public String modifyProduct(){
		ShopCart car=(ShopCart) session.get("car");
		car.modify(id, amount);
		return SUCCESS;
	}
	
	public String removeProduct(){
		ShopCart car=(ShopCart) session.get("car");
		car.deleteCar(id);
		return SUCCESS;
	}
	public String clearProduct(){
		ShopCart car=(ShopCart) session.get("car");
		car.deleteAll();
		return SUCCESS;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getGg() {
		return gg;
	}

	public void setGg(int gg) {
		this.gg = gg;
	}

	public GgService getGgService() {
		return ggService;
	}

	public void setGgService(GgService ggService) {
		this.ggService = ggService;
	}
	
}
