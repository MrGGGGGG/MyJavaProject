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
	 * 创建新订单的方法
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
	 * 对订单进行支付的方法。改变订单的状态
	 * @param order
	 * @return 如果付款成功。即将数据库中的订单状态改变成‘已付款’，返回ture。否则返回false
	 * 
	 */
	public boolean payorderdao(Order order){
		String sql = "UPDATE orders SET ostatus = '已付款' WHERE onumber = ?";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql, order.getOnumber());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("改付款状态影响行数：" + n);
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 查询所有订单的方法
	 * @return 如果表中有数据。查询到的结果封装在List集合里返回
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
	 * 根据客户编号查找对应的订单。
	 * @param user，用到user.getCid()方法
	 * @return 如果表中有数据。查询到的结果封装在List集合里返回
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
	 * 根据订单编号批量删除订单
	 * @param 参数是一个装有要删除的订单编号的Set集合
	 * @return 如果删除成功，返回true，否则返回false
	 */
	public boolean doRemoveBatch(Set<String> onums){
		if(onums == null || onums.size() == 0){   //没有要删除的数据
			return false;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM orders WHERE onumber IN(");//拼凑sql语句
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
