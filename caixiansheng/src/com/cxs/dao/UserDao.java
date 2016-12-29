package com.cxs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

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
}
