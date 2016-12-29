package com.cxs.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cxs.entity.Admin;
import com.cxs.entity.Product;
import com.cxs.service.AdminService;
import com.cxs.service.ProductService;
public class AdminAction extends SuperAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	////1、封装请求数据
	private Admin admin;
	private String[] chkName;  
	public String[] getChkName(){  
		return this.chkName;  
	}  
	public void setChkName(String[] chkName){  
	    this.chkName=chkName;  
	}  
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	//2、调用service，生成对象
	//private UserService userservice = new UserService();
	//private OrderService orderservice  = new OrderService();
	private ProductService productservice  = new ProductService();
	private AdminService adminservice = new AdminService();
	
	/**
	 * 管理员的登录的方法
	 * @return
	 */
	public String login(){
		System.out.println("进入了adminaction");
		//System.out.println(user.getCid()+user.getCpsd());
		System.out.println("接收到的用户名和密码："+admin.getAdminid()+admin.getAdminpassword());
		Admin admininfo = adminservice.login(admin);
		if(admininfo!=null){
			//登录成功
			session.setAttribute("admininfo", admininfo.getAdminname());
			session.setAttribute("adminid", admininfo.getAdminid());
			return "managerindex";
		}else{
			return "managerlogin";
		}
	}
	
	/**
	 * 管理员页面显示所有产品的方法
	 * @return
	 */
	public String showAllProduct(){
		System.out.println("调用了showallproduct方法");
		List<Product> list = new ArrayList<Product>();
		System.out.println("集合大小："+list.isEmpty());
		list = productservice.getAllProduct();
		//System.out.println("集合大小："+list.isEmpty());
		if(list.size()>0){
			session.setAttribute("list", list);
			return "chanpinguanli";
		}else{
			return "";
		}
	}
	/**
	 * 批量删除产品的方法
	 * @return
	 */
	public String Delete(){
		System.out.println("调用了删除方法");
		Set<Integer> pids = new HashSet<Integer>();
		System.out.println(this.chkName.length);
		for(int i=0;i<this.getChkName().length;i++){
			//System.out.println(this.getChkName()[i]);
			pids.add(Integer.valueOf(this.getChkName()[i]));
		}
		boolean isdelete = productservice.doRemoveBatch(pids);
		if(isdelete==true){
			List<Product> list = productservice.getAllProduct();
			session.setAttribute("list", list);
		}
		return "chanpinguanli";
	}
	/**
	 * 删除用户的方法
	 */
	public String DeleteUser(){
		System.out.println("调用了删除用户的方法。");
		Set<Integer> cids = new HashSet<Integer>();
		for(int i=0;i<this.getChkName().length;i++){
			//System.out.println(this.getChkName()[i]);
			cids.add(Integer.valueOf(this.getChkName()[i]));
		}
		return "";
	}
}
