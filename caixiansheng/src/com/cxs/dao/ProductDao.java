package com.cxs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Product;
import com.cxs.utils.DBCPUtils;

public class ProductDao {
	/**
	 * ��ʾ������Ʒ�ķ���
	 * @return ������������ݡ���ѯ���Ľ����װ��List�����ﷵ��
	 */
	public List<Product> FindAll(){
		List<Product> list= new ArrayList<Product>();
		String sql = "select * from product";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Product>> h = new BeanListHandler<Product>(
				Product.class);
		try {
			list = runner.query(sql, h);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * �������Ʒ�ķ���
	 * @param product����
	 * @return �����ӳɹ�������true�����򷵻�false��
	 */
	public boolean doCreat(Product product){
		String sql = "insert into product values(null,?,?,?,?,?,?,?,?,?)";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n= runner.update(sql,product.getPname(),
								 product.getPintro(),
								 product.getPcount(),
								 product.getPrice(),
								 product.getPicture(),
								 product.getPdate(),
								 product.getFid(),
								 product.getTypeid(),
								 product.getSyid());
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
	 * ����ɾ������
	 * @param һ���洢��Ʒid��set���ϣ�
	 * @return ���ɾ���ɹ�������true�����򷵻�false��
	 */
	public boolean doRemoveBatch(Set<Integer> pids){
		if(pids == null || pids.size() == 0){   //û��Ҫɾ��������
			return false;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM product WHERE pid IN(");
		Iterator<Integer> iter = pids.iterator();
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
	
	/**
	 * ���ղ�Ʒ������ҵķ���
	 * @param type
	 * @return
	 */
	public List<Product> findByType(String type){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT pid,pname,pintro,pcount,price,picture,pdate,fid,product.typeid,syid "
				+ "FROM product,type "
				+ "WHERE product.typeid = type.typeid AND typename=?";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Product>> h = new BeanListHandler<Product>(
				Product.class);
		try {
			list = runner.query(sql, h,type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * �û�����ɹ�֮���޸Ŀ�����ĺ���
	 */
	public boolean changekucun(int change,int pid){
		String sql ="UPDATE product SET pcount = pcount-? WHERE pid = ?";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		int n = 0;
		try {
			n = runner.update(sql,change,pid);
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
	 * ģ����ѯ
	 */
	public List<Product> search(String keyword){
		List<Product> list = new ArrayList<Product>();
		String sql="SELECT * FROM product WHERE pname like ?";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Product>> h = new BeanListHandler<Product>(
				Product.class);
		try {
			list = runner.query(sql, h,"%"+keyword+"%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
