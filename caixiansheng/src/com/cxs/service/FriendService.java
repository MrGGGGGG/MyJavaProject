package com.cxs.service;

import java.util.List;

import com.cxs.dao.FriendDao;
import com.cxs.entity.User;

public class FriendService {
	
	FriendDao frienddao = new FriendDao();
	//查询指定id 的用户的所有好友的业务,即获得好友列表
	public List<User> getFriendList(int cid){
		List<User> list = frienddao.getFriendList(cid);
		return list;
	}
	//添加好友的业务
	public boolean addFriend(int cid1,int cid2){
		boolean isadd = frienddao.addFriend(cid1, cid2);
		return isadd;
	} 
	// 删除指定的业务
	public boolean deleteFriend(int cid1,int cid2){
		boolean isdelete = frienddao.deleteFriend(cid1, cid2);
		return isdelete;
	}
	
}
