package com.cxs.service;

import com.cxs.dao.UserDao;
import com.cxs.dao.UserDaoimpl;
import com.cxs.entity.User;

public class UserService {
	private UserDao userdao= new UserDao();
	public User login(User user){
		try {
			return userdao.login(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
