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
	//����service����
	OrderService orderservice = new OrderService();
	
	//���ɶ����ķ���
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
	
	//�����û�id�ҵ����û���ȫ������
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
	//���ݶ����������ɾ������
	public String deleteOrders(){
		System.out.println("������ɾ����������"); 
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
