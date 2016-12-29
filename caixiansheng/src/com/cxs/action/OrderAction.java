package com.cxs.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cxs.entity.Order;
import com.cxs.service.OrderService;

public class OrderAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String[] chkName;  
	public String[] getChkName(){  
	    return chkName;  
	    }  
	 public void setChkName(String[] chkName){  
	    this.chkName=chkName;  
	    }  
	//生成service对象
	OrderService orderservice = new OrderService();
	
	//生成订单的方法
	public String makeOrder(){
		Order odr = (Order)session.getAttribute("neworder");
		odr.setOaddress(request.getParameter("address"));
		boolean issuccess = orderservice.addNewOrder(odr);
		if(issuccess==true){
			return "orderaddsuccess";
		}else{
			return "orderaddfaild";
		}
	}
	
	//根据用户id找到该用户的全部订单
	public String showMyOrder(){
		if(session.getAttribute("userid") == null){
			return "weidenglu";
		}
		List<Order> list = orderservice.findOrderById((Integer)session.getAttribute("userid"));
		if(list.size()!=0){
			session.setAttribute("myorder", list);
			
		}
		return "myorder";
	}
	//根据订单编号批量删除订单
	public String deleteOrders(){
		System.out.println("调用了删除订单方法"); 
		Set<String> onums = new HashSet<String>();
		for(int i=0;i<this.getChkName().length;i++){
			//System.out.println(this.getChkName()[i]);
			onums.add(this.getChkName()[i]);
		}
		boolean isdelete = orderservice.doRemoveBatch(onums);
		if(isdelete == true){
			List<Order> list = orderservice.findOrderById((Integer)session.getAttribute("userid"));
			session.setAttribute("myorder", list);
			return "orderdeletesuccess";
		}else{
			return "orderdeletefaild";
		}
	}
}
