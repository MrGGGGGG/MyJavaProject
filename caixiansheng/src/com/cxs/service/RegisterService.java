package com.cxs.service;
//import com.cxs.dao.UserDaoimpl;
import com.cxs.entity.Register;
import com.cxs.dao.RegisterDao;


public class RegisterService {
	private RegisterDao registerdao= new RegisterDao();
	public Register register(Register register){
		try {
			return registerdao.register(register);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
