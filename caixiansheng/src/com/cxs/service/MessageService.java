package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.MessageDao;
import com.cxs.entity.Message;

public class MessageService {
	MessageDao messagedao = new MessageDao();	
	//����һ���¶�̬�ķ���
	public boolean doCreate(Message message){
		boolean isCreate = messagedao.doCreate(message);
		return isCreate;
	}
	//ɾ��һ����̬�ķ���
	public boolean deleteMessage(int messageid){
		boolean isdelete = messagedao.deleteMessage(messageid);
		return isdelete;
	}
	//ת��һ����̬�ķ���
	public boolean zhuanfa(int cid,int messageid){
		boolean iszhuanfa = messagedao.zhuanfa(cid, messageid);
		return iszhuanfa;
	}
	 //���޵ķ���
	public boolean dianzan(int messageid){
		boolean isdianzan = messagedao.dianzan(messageid);
		return isdianzan;
	}
	//����ID����û����з����Ķ�̬
	public List<Message> showAllMessageById(int cid){
		List<Message> list= messagedao.showAllMessageById(cid);
		return list;
	}
	//����Id������к��ѷ����Ķ�̬
	public List<Message> showAllFriendMessage(Set<Integer> ids){
		List<Message> list = messagedao.showAllFriendMessage(ids);
		return list;
	}
}
