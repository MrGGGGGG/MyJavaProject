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
	 * ��ѯָ��id ���û������к��ѷ���,����ú����б�
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
	 * ��Ӻ��ѵķ���
	 * @param ����û��ı��cid1��������û��ı��cid2
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
	 * ɾ��ָ���ĺ���
	 */
	public boolean deleteFriend(int cid1,int cid2){
		String sql ="DELETE FROM friend WHERE user1=? AND user2=?";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,cid1,cid2);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("��ִ��ɾ��������ʱ�����");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
}
