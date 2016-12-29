package com.cxs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Order;
import com.cxs.utils.DBCPUtils;

public class OrderDao {
	/**
	 * �����¶����ķ���
	 * @param order
	 * @return true & false
	 */
	public boolean creatorder(Order order){
		String sql = "insert into orders values(?,?,?,?,?,?,?,?,?,?,?)";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
				n = runner.update(sql, order.getOnumber(),
									   order.getPname(),
									   order.getOcount(),
									   order.getOprice(),
									   order.getOstatus(),
									   order.getOdate(),
									   order.getOaddress(),
									   order.getOlog(),
									   order.getEvid(),
									   order.getCid(),
									   order.getPid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * �Զ�������֧���ķ������ı䶩����״̬
	 * @param order
	 * @return �������ɹ����������ݿ��еĶ���״̬�ı�ɡ��Ѹ��������ture�����򷵻�false
	 * 
	 */
	public boolean payorderdao(Order order){
		String sql = "UPDATE orders SET ostatus = '�Ѹ���' WHERE onumber = ?";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql, order.getOnumber());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("�ĸ���״̬Ӱ��������" + n);
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * ��ѯ���ж����ķ���
	 * @return ������������ݡ���ѯ���Ľ����װ��List�����ﷵ��
	 */
	public List<Order> findAllOrder(){
		String sql = "SELECT * FROM orders ";
		List<Order> list = new ArrayList<Order>();
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Order>> h = new BeanListHandler<Order>(Order.class); 
		try {
			list = runner.query(sql, h);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * ���ݿͻ���Ų��Ҷ�Ӧ�Ķ�����
	 * @param user���õ�user.getCid()����
	 * @return ������������ݡ���ѯ���Ľ����װ��List�����ﷵ��
	 */
	public List<Order> findOrderById(int cid){
		String sql="SELECT * FROM orders WHERE cid = ?";
		List<Order> list = new ArrayList<Order>();
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Order>> h = new BeanListHandler<Order>(Order.class); 
		try {
			list = runner.query(sql, h,cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * ���ݶ����������ɾ������
	 * @param ������һ��װ��Ҫɾ���Ķ�����ŵ�Set����
	 * @return ���ɾ���ɹ�������true�����򷵻�false
	 */
	public boolean doRemoveBatch(Set<String> onums){
		if(onums == null || onums.size() == 0){   //û��Ҫɾ��������
			return false;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM orders WHERE onumber IN(");//ƴ��sql���
		Iterator<String> iter = onums.iterator();
		while(iter.hasNext()){
			sql.append(iter.next()).append(",");
		}
		sql.delete(sql.length()-1, sql.length()).append(")");
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
}
