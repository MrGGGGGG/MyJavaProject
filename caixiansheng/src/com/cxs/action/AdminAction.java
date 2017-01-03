package com.cxs.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cxs.entity.Admin;
import com.cxs.entity.Order;
import com.cxs.entity.Product;
import com.cxs.entity.User;
import com.cxs.service.AdminService;
import com.cxs.service.OrderService;
import com.cxs.service.ProductService;
import com.cxs.service.UserService;
public class AdminAction extends SuperAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	////1����װ��������
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
	//2������service�����ɶ���
	private UserService userservice = new UserService();
	private OrderService orderservice  = new OrderService();
	private ProductService productservice  = new ProductService();
	private AdminService adminservice = new AdminService();
	
	/**
	 * ����Ա�ĵ�¼�ķ���
	 * @return
	 */
	public String login(){
		System.out.println("������adminaction");
		//System.out.println(user.getCid()+user.getCpsd());
		System.out.println("���յ����û��������룺"+admin.getAdminid()+admin.getAdminpassword());
		Admin admininfo = adminservice.login(admin);
		if(admininfo!=null){
			//��¼�ɹ�
			session.setAttribute("admininfo", admininfo.getAdminname());
			session.setAttribute("adminid", admininfo.getAdminid());
			return "managerindex";
		}else{
			return "managerlogin";
		}
	}
	
	/**
	 * ����Աע����¼�ķ���
	 */
	public String logout(){
		if(session.getAttribute("admininfo")!=null){
			session.removeAttribute("admininfo");
			session.removeAttribute("adminid");
		}
		return "managerlogin";
	}
	
	
	/**
	 * ����Աҳ����ʾ���в�Ʒ�ķ���
	 * @return
	 */
	public String showAllProduct(){
		System.out.println("������showallproduct����");
		List<Product> list = new ArrayList<Product>();
		System.out.println("���ϴ�С��"+list.isEmpty());
		list = productservice.getAllProduct();
		//System.out.println("���ϴ�С��"+list.isEmpty());
		if(list.size()>0){
			session.setAttribute("list", list);
			return "chanpinguanli";
		}else{
			return "";
		}
	}
	/**
	 * ����Ա����ɾ����Ʒ�ķ���
	 * @return
	 */
	public String Delete(){
		System.out.println("������ɾ������");
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
	 * ����Աҳ����ʾ�����û��ķ���
	 */
	public String FindAllUser(){
		List<User> list = new ArrayList<User>();
		list = userservice.FindAllUser();
		if(list.size()>0){
			session.setAttribute("userlist", list);
			return "yonghuguanli";
		}else{
			return "";
		}
	}
	
	
	/**
	 * ����Ա����ɾ���û��ķ��� 
	 */
	public String DeleteUser(){
		System.out.println("������ɾ���û��ķ�����");
		Set<Integer> cids = new HashSet<Integer>();
		for(int i=0;i<this.getChkName().length;i++){
			System.out.println(this.getChkName()[i]);
			cids.add(Integer.valueOf(this.getChkName()[i]));
		}
		boolean isdelete = userservice.doRemoveBatch(cids) ;
		if(isdelete==true){
			List<User> list = userservice.FindAllUser();
			session.setAttribute("userlist", list);
		}
		return "yonghuguanli";
	}
	
	/**
	 * ����Աҳ����ʾ���ж����ķ���
	 */
	public String findAllOrder(){
		System.out.println("��������ʾ�����ķ�����");
		List<Order> list = new ArrayList<Order>();
		list = orderservice.findAllOrder();
		if(list.size()>0){
			session.setAttribute("orderlist", list);
			return "dingdanguanli";
		}else{
			return "";
		}
	}
	
	/**
	 * ����Ա����ɾ�������ķ��� 
	 */
	public String DeleteOrder(){
		System.out.println("������ɾ�������ķ�����");
		Set<String> oids = new HashSet<String>();
		for(int i=0;i<this.getChkName().length;i++){
			//System.out.println(this.getChkName()[i]);
			oids.add(this.getChkName()[i]);
		}
		boolean isdelete = orderservice.doRemoveBatch(oids) ;
		if(isdelete==true){
			List<Order> list = orderservice.findAllOrder();
			session.setAttribute("orderlist", list);
		}
		return "dingdanguanli";
	}
}
