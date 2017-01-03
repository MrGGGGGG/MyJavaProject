package com.cxs.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.cxs.entity.Product;
import com.cxs.service.ProductService;

public class ProductAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//��װ��������
	private File file;
	private Product product;
	private String typeid;
	private String fileFileName;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public ProductService getProductservice() {
		return productservice;
	}

	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}



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
		//System.out.println("�������½���Ʒ�ķ�����");
		//System.out.println("�ļ���"+this.file);
		//System.out.println("�ļ����ƣ�"+this.fileFileName);
		//System.out.println("ʵ�����ݣ�"+this.product.toString());
		//System.out.println("������Ϣ:" + this.typeid);
		String pdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		product.setPicture(fileFileName);
		product.setPdate(pdate);
		product.setTypeid(Integer.parseInt(typeid));
		String imgpath = ServletActionContext.getServletContext().getRealPath("images");
		String storepath = "E:/GitRepositories/caixiansheng/WebRoot/images";
		try {
			FileUtils.copyFile(this.file, new File(imgpath,fileFileName));
			FileUtils.copyFile(this.file, new File(storepath,fileFileName));
		} catch (IOException e) {
			System.out.println("��ִ�б����ļ���ʱ�����");
			e.printStackTrace();
		}
		product.setPicture(fileFileName);
		//System.out.println(product.toString());
		boolean iscreat = productservice.docreat(product);
		if(iscreat==true){
			List<Product> list = productservice.getAllProduct();
			session.setAttribute("list", list);
			return "creatproductsuccess";
		}else{
			return "";
		}
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
