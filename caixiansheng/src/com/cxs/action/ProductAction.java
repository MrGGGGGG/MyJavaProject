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
	
	//��װ��������
	//private Product p = new Product();
	//���ò�Ʒservice,����service����
	private ProductService productservice = new ProductService();
	/**
	 * չʾ���в�Ʒ�ķ���
	 * @return
	 */
	public String showAllProduct(){
		//System.out.println("������showallproduct����");
		List<Product> list = new ArrayList<Product>();
		//System.out.println("���ϴ�С��"+list.isEmpty());
		list = productservice.getAllProduct();
		//System.out.println("���ϴ�С��"+list.isEmpty());
		if(list.size()>0){
			session.setAttribute("list", list);
			return "findallproductsuccess";
		}else{
			return "findallproductfailed";
		}
	}
	
	/**
	 * ����²�Ʒ
	 * @return
	 */
	public String docreat(){
		
		return "";
	}
	
	/**
	 * ����ɾ��
	 * @return
	 */
	public String doRemoveBatch(){
		return "";
	}
	
	
	/**
	 * �����������
	 * @return
	 */
	public String findByType(){
		
		return "";
	}
	
}
