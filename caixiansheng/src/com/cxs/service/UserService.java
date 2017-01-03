package com.cxs.service;

import java.util.List;
import java.util.Set;

import com.cxs.dao.UserDao;
import com.cxs.dao.UserDaoimpl;
import com.cxs.entity.User;

public class UserService {
	private UserDao userdao= new UserDao();
	
	/**
	 * 用户登录的业务
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
	 * 显示所有用户的业务
	 */
	public List<User> FindAllUser(){
		List<User> list = userdao.FindAllUser();
		return list;
	}
	
	/**
	 * 批量删除用户的业务
	 */
	public boolean doRemoveBatch(Set<Integer> cids){
		boolean isdelete = userdao.doRemoveBatch(cids);
		return isdelete;
	}
	
}
