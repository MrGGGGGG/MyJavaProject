package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.UserDao;
import com.cxs.dao.UserDaoimpl;
import com.cxs.entity.User;

public class UserService {
	private UserDao userdao= new UserDao();
	
	/**
	 * �û���¼��ҵ��
	 * @param user
	 * @return
	 */
	public User login(User user){
		try {
			return userdao.login(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * ��ʾ�����û���ҵ��
	 */
	public List<User> FindAllUser(){
		List<User> list = userdao.FindAllUser();
		return list;
	}
	
	/**
	 * ����ɾ���û���ҵ��
	 */
	public boolean doRemoveBatch(Set<Integer> cids){
		boolean isdelete = userdao.doRemoveBatch(cids);
		return isdelete;
	}
	
}
