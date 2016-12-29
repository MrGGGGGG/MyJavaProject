package com.cxs.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cxs.entity.Product;
import com.cxs.service.ProductService;

public class ProductAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//封装请求数据
	//private Product p = new Product();
	//调用产品service,生成service对象
	private ProductService productservice = new ProductService();
	/**
	 * 展示所有产品的方法
	 * @return
	 */
	public String showAllProduct(){
		//System.out.println("调用了showallproduct方法");
		List<Product> list = new ArrayList<Product>();
		//System.out.println("集合大小："+list.isEmpty());
		list = productservice.getAllProduct();
		//System.out.println("集合大小："+list.isEmpty());
		if(list.size()>0){
			session.setAttribute("list", list);
			return "findallproductsuccess";
		}else{
			return "findallproductfailed";
		}
	}
	
	/**
	 * 添加新产品
	 * @return
	 */
	public String docreat(){
		
		return "";
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	public String doRemoveBatch(){
		return "";
	}
	
	
	/**
	 * 按照种类查找
	 * @return
	 */
	public String findByType(){
		
		return "";
	}
	
}
