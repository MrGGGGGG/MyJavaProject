package com.cxs.action;

import com.cxs.entity.Order;
import com.cxs.service.OrderService;
import com.cxs.service.ProductService;

public class PayAction extends SuperAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//����service
	OrderService orderservice = new OrderService();
	ProductService productservice = new ProductService();
	public String payorder(){
		Order order = new Order();
		order = (Order)session.getAttribute("neworder");
		System.out.println("�����������" + order.getOcount());
		//double n = Double.valueOf(request.getParameter("num2"));
		//System.out.println("���������"+n);
		boolean ispaysuccess = orderservice.payorder(order);
		boolean ischange = productservice.changekucun(order.getOcount(), order.getPid());
		if(ispaysuccess == true && ischange ==true){
			return "paysuccess";
		}else{
			return "payfaild";
		}
	}
}
