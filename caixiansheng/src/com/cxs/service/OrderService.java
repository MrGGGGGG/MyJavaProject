package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.OrderDao;
import com.cxs.entity.Order;

public class OrderService {
	
	private OrderDao orderdao = new OrderDao();
	
	//����¶�������
	public boolean addNewOrder(Order order){
		boolean iscreat = orderdao.creatorder(order);
		return iscreat;
	}
	//���������
	public boolean payorder(Order order){
		boolean ispay = orderdao.payorderdao(order);
		return ispay;
	}
	//�����û���Ų��Ҷ����������� ���ҵĶ��������÷���
	public List<Order> findOrderById(int cid){
		List<Order> list = orderdao.findOrderById(cid);
		return list;
	}
	//���ݶ����������ɾ������
	public boolean doRemoveBatch(Set<String> onums){
		boolean isdelete = orderdao.doRemoveBatch(onums);
		return isdelete;
	}
	//��ʾ���ж�����ҵ��
	public List<Order> findAllOrder(){
		List<Order> list  = orderdao.findAllOrder();
		return list;
	}
}
