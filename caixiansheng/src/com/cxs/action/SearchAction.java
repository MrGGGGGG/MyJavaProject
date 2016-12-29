package com.cxs.action;

import java.util.List;

import com.cxs.entity.Product;
import com.cxs.service.ProductService;

public class SearchAction extends SuperAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	ProductService productservice = new ProductService();
	public String search(){
		List<Product> list =  productservice.search(keyword);
		if(list.size()>0){
			session.setAttribute("searchlist", list);
			return "searchresult";
		}else{
			return "nosearchresult";
		}
	}
}
