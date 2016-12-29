package com.cxs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.cxs.dao.ProductDao;
import com.cxs.entity.Product;

public class ProductService {
	private ProductDao productdao = new ProductDao();
	/**
	 * ���������Ʒ�б�ķ���
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
	 * ����²�Ʒ��ҵ��
	 * @param product
	 * @return
	 */
	public boolean docreat(Product product){
		boolean iscreat = productdao.doCreat(product);
		return iscreat;
	}
	
	
	/**
	 * ����ɾ����ҵ��
	 * @param pids
	 * @return
	 */
	public boolean doRemoveBatch(Set<Integer> pids){
		boolean isdelet = productdao.doRemoveBatch(pids);
		return isdelet;
	}
	
	
	/**
	 * ����������ҵ�ҵ��
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
	 * �޸Ŀ���ҵ��
	 */
	public boolean changekucun(int change,int pid){
		boolean ischange = productdao.changekucun(change, pid);
		return ischange;
	}
	
	/**
	 * ģ����ѯ��ҵ��
	 */
	
	public List<Product> search(String keyword){
		List<Product> list = productdao.search(keyword);
		return list;
	}
}
