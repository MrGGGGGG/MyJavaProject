package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.OrderDao;
import com.cxs.entity.Order;

public class OrderService {
	
	private OrderDao orderdao = new OrderDao();
	
	//添加新订单方法
	public boolean addNewOrder(Order order){
		boolean iscreat = orderdao.creatorder(order);
		return iscreat;
	}
	//订单付款方法
	public boolean payorder(Order order){
		boolean ispay = orderdao.payorderdao(order);
		return ispay;
	}
	//根据用户编号查找订单方法。即 “我的订单”调用方法
	public List<Order> findOrderById(int cid){
		List<Order> list = orderdao.findOrderById(cid);
		return list;
	}
	//根据订单编号批量删除订单
	public boolean doRemoveBatch(Set<String> onums){
		boolean isdelete = orderdao.doRemoveBatch(onums);
		return isdelete;
	}
	//显示所有订单的业务
	public List<Order> findAllOrder(){
		List<Order> list  = orderdao.findAllOrder();
		return list;
	}
}
