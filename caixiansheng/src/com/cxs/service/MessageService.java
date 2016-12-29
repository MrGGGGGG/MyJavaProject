package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.MessageDao;
import com.cxs.entity.Message;

public class MessageService {
	MessageDao messagedao = new MessageDao();	
	//发布一条新动态的方法
	public boolean doCreate(Message message){
		boolean isCreate = messagedao.doCreate(message);
		return isCreate;
	}
	//删除一条动态的方法
	public boolean deleteMessage(int messageid){
		boolean isdelete = messagedao.deleteMessage(messageid);
		return isdelete;
	}
	//转发一条动态的方法
	public boolean zhuanfa(int cid,int messageid){
		boolean iszhuanfa = messagedao.zhuanfa(cid, messageid);
		return iszhuanfa;
	}
	 //点赞的方法
	public boolean dianzan(int messageid){
		boolean isdianzan = messagedao.dianzan(messageid);
		return isdianzan;
	}
	//根据ID查出用户所有发布的动态
	public List<Message> showAllMessageById(int cid){
		List<Message> list= messagedao.showAllMessageById(cid);
		return list;
	}
	//根据Id查出所有好友发布的动态
	public List<Message> showAllFriendMessage(Set<Integer> ids){
		List<Message> list = messagedao.showAllFriendMessage(ids);
		return list;
	}
}
