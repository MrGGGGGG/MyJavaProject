package com.cxs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Message;
import com.cxs.utils.DBCPUtils;

public class MessageDao {
	/**
	 * 发布一条新动态的方法
	 */
	public boolean doCreate(Message message){
		String sql = "insert into message values(?,?,?,?,?,?,?)";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n = runner.update(sql,null,
								  message.getCid(),
								  message.getCname(),
								  message.getMessage_text(),
								  message.getMessage_time(),
								  message.getMessage_img(),
								  0);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("在执行新建动态的时候发生错误！");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 删除一条动态的方法
	 */
	public boolean deleteMessage(int messageid){
		String sql ="DELETE FROM message WHERE message_id=?";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,messageid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("在执行删除动态方法的时候出错！");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 转发一条动态的方法
	 * @param cid
	 * @param messageid
	 * @return
	 */
	public boolean zhuanfa(int cid,int messageid){
		String sql="UPDATE message SET cid=? WHERE message_id=?";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,messageid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("在执行转发动态方法的时候出错！");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 点赞的方法
	 */
	public boolean dianzan(int messageid){
		String sql="UPDATE message SET message_zan=message+1 WHERE message_id=?";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,messageid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("在执行点赞方法的时候出错！");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 根据ID查出用户所有发布的动态
	 */
	public List<Message> showAllMessageById(int cid){
		String sql="SELECT * FROM message WHERE cid = ?";
		List<Message> list = new ArrayList<Message>();
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Message>> h = new BeanListHandler<Message>(Message.class); 
		try {
			list = runner.query(sql, h, cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list.size()>0){
			return list;
		}else{
			System.out.println("动态集合为空！");
			return null;
		}
	}
	/**
	 * 查出用户所有好友发布的动态的方法
	 */
	public List<Message> showAllFriendMessage(Set<Integer> ids){
		if(ids == null || ids.size() == 0){   //没有要删除的数据
			return null;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM message WHERE cid IN(");//拼凑sql语句
		Iterator<Integer> iter = ids.iterator();
		while(iter.hasNext()){
			sql.append(iter.next()).append(",");
		}
		sql.delete(sql.length()-1, sql.length()).append(")");
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		ResultSetHandler<List<Message>> h = new BeanListHandler<Message>(Message.class); 
		List<Message> list = new ArrayList<Message>();
		try {
			list = runner.query(sql.toString(), h);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
