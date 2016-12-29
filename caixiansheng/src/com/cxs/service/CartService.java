package com.cxs.service;

import java.util.ArrayList;
import java.util.List;

import com.cxs.dao.CartDao;
import com.cxs.entity.Cart;
import com.cxs.entity.Product;

public class CartService {
	private CartDao cartdao = new CartDao();
	public void cart(String shid,String pid,String cid){
		try {
			cartdao.join(shid,pid,cid);
		} catch (Exception e) {
			throw new RuntimeException(e);
	  }	
	}
	
	public List<Product> selectcart(String cid){
		List<Product> list = new ArrayList<Product>();
		try {
			list=cartdao.selcetcart(cid);
		}catch (Exception e) {
			throw new RuntimeException(e);
	}
		return list;
  }
	
	public void deletecart(String pid,String cid){
		try {
			cartdao.deletecart(pid,cid);
		} catch (Exception e) {
			throw new RuntimeException(e);
	  }	
	}
}