package com.cxs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Order;
import com.cxs.entity.User;
import com.cxs.utils.DBCPUtils;

public class FriendDao {
	/**
	 * 查询指定id 的用户的所有好友方法,即获得好友列表
	 */
	public List<User> getFriendList(int cid){
		String sql = "SELECT * FROM customer WHERE cid IN(SELECT user2 FROM friend WHERE user1 = ?);";
		List<User> list = new ArrayList<User>();
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<User>> h = new BeanListHandler<User>(User.class); 
		try {
			list = runner.query(sql, h,cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 添加好友的方法
	 * @param 添加用户的编号cid1，被添加用户的编号cid2
	 */
	public boolean addFriend(int cid1,int cid2){
		String sql = "insert into friend values(null,?,?)";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n = runner.update(sql,cid1,cid2);
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
	 * 删除指定的好友
	 */
	public boolean deleteFriend(int cid1,int cid2){
		String sql ="DELETE FROM friend WHERE user1=? AND user2=?";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,cid1,cid2);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("在执行删除方法的时候出错！");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
}
