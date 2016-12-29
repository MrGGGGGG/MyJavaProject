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
	 * ����һ���¶�̬�ķ���
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
			System.out.println("��ִ���½���̬��ʱ��������");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * ɾ��һ����̬�ķ���
	 */
	public boolean deleteMessage(int messageid){
		String sql ="DELETE FROM message WHERE message_id=?";
		int n = 0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,messageid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("��ִ��ɾ����̬������ʱ�����");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * ת��һ����̬�ķ���
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
			System.out.println("��ִ��ת����̬������ʱ�����");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * ���޵ķ���
	 */
	public boolean dianzan(int messageid){
		String sql="UPDATE message SET message_zan=message+1 WHERE message_id=?";
		int n=0;
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		try {
			n=runner.update(sql,messageid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("��ִ�е��޷�����ʱ�����");
		}
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * ����ID����û����з����Ķ�̬
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
			System.out.println("��̬����Ϊ�գ�");
			return null;
		}
	}
	/**
	 * ����û����к��ѷ����Ķ�̬�ķ���
	 */
	public List<Message> showAllFriendMessage(Set<Integer> ids){
		if(ids == null || ids.size() == 0){   //û��Ҫɾ��������
			return null;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM message WHERE cid IN(");//ƴ��sql���
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
