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
import com.cxs.entity.User;
import com.cxs.utils.DBCPUtils;

public class UserDao {
	//登录方法
	public User login(User user){
		String sql = "select * from customer where cid=? and cpsd=?";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		List<User> list = null;
		// 结果集处理器
		ResultSetHandler<List<User>> h = new BeanListHandler<User>(
				User.class);
		try {
			list =runner.query(sql, h,user.getCid(),user.getCpsd());
			return list.get(0);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 根据电话号码查找指定用户的方法
	 * 
	 */
	public User findUserByTel(String ctel){
		String sql = "SELECT * FROM customer where ctel = ?";
		List<User> list = new ArrayList<User>();
		ResultSetHandler<List<User>> h = new BeanListHandler<User>(
				User.class);
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			list =runner.query(sql, h,ctel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list.get(0);
	}
	
	/**
	 * 显示所有用户的方法
	 */
	public List<User> FindAllUser(){
		List<User> list= new ArrayList<User>();
		String sql = "select * from customer";
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<User>> h = new BeanListHandler<User>(
				User.class);
		try {
			list = runner.query(sql, h);
		} catch (SQLException e) {
			System.out.println("在调用显示所有用户的时候出错!");
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	/**
	 * 批量删除用户的方法
	 */
	public boolean doRemoveBatch(Set<Integer> uids){
		if(uids == null || uids.size() == 0){   //没有要删除的数据
			return false;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM customer WHERE cid IN(");
		Iterator<Integer> iter = uids.iterator();
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
