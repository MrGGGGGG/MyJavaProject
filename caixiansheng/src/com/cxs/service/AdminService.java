package com.cxs.service;

import com.cxs.dao.AdminDao;
import com.cxs.entity.Admin;

public class AdminService {
	AdminDao admindao = new AdminDao();
	public Admin login(Admin admin){
		try {
			return admindao.login(admin);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
