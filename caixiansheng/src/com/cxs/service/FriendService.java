package com.cxs.service;

import java.util.List;

import com.cxs.dao.FriendDao;
import com.cxs.entity.User;

public class FriendService {
	
	FriendDao frienddao = new FriendDao();
	//��ѯָ��id ���û������к��ѵ�ҵ��,����ú����б�
	public List<User> getFriendList(int cid){
		List<User> list = frienddao.getFriendList(cid);
		return list;
	}
	//��Ӻ��ѵ�ҵ��
	public boolean addFriend(int cid1,int cid2){
		boolean isadd = frienddao.addFriend(cid1, cid2);
		return isadd;
	} 
	// ɾ��ָ����ҵ��
	public boolean deleteFriend(int cid1,int cid2){
		boolean isdelete = frienddao.deleteFriend(cid1, cid2);
		return isdelete;
	}
	
}
