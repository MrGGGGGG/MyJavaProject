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
	
	//封装请求数据
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
		//System.out.println("调用了新建商品的方法！");
		//System.out.println("文件："+this.file);
		//System.out.println("文件名称："+this.fileFileName);
		//System.out.println("实例内容："+this.product.toString());
		//System.out.println("种类信息:" + this.typeid);
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
			System.out.println("在执行保存文件的时候出错！");
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
