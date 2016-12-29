package com.cxs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Product;

import com.cxs.utils.DBCPUtils;

public class CartDao {
	//���빺�ﳵ
	public String join(String shid, String pid,String cid){
		
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		
		String sql = "insert into cart (shid,pid,cid) values(?,?,?)";
		try {
			runner.update(sql,shid,pid,cid);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}
	//��ʾ���ﳵ
	public List<Product> selcetcart(String cid){
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		String sql2="SELECT * FROM cart,product WHERE cart.pid = product.pid AND cart.cid=?";
		List<Product> list = null;
		// �����������
		ResultSetHandler<List<Product>> h = new BeanListHandler<Product>(
				Product.class);
		try {
			list =runner.query(sql2, h,cid);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//ɾ�����ﳵĳ��
	public String deletecart(String pid,String cid){
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		String sql = "delete  from cart where pid =? and cid=?";
		try {
			runner.update(sql,pid,cid);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		
		return null;
	}
	
}
