package com.cxs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.cxs.dao.ProductDao;
import com.cxs.entity.Product;

public class ProductService {
	private ProductDao productdao = new ProductDao();
	/**
	 * 获得所有商品列表的方法
	 * @return
	 */
	public List<Product> getAllProduct(){
		List<Product> list = new ArrayList<Product>();
		try{
		list = productdao.FindAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 添加新产品的业务
	 * @param product
	 * @return
	 */
	public boolean docreat(Product product){
		boolean iscreat = productdao.doCreat(product);
		return iscreat;
	}
	
	
	/**
	 * 批量删除的业务
	 * @param pids
	 * @return
	 */
	public boolean doRemoveBatch(Set<Integer> pids){
		boolean isdelet = productdao.doRemoveBatch(pids);
		return isdelet;
	}
	
	
	/**
	 * 按照种类查找的业务
	 * @param type
	 * @return
	 */
	public List<Product> findByType(String type){
		List<Product> list = new ArrayList<Product>();
		try{
		list = productdao.findByType(type);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 修改库存的业务
	 */
	public boolean changekucun(int change,int pid){
		boolean ischange = productdao.changekucun(change, pid);
		return ischange;
	}
	
	/**
	 * 模糊查询的业务
	 */
	
	public List<Product> search(String keyword){
		List<Product> list = productdao.search(keyword);
		return list;
	}
}
