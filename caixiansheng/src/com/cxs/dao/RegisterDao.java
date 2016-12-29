package com.cxs.dao;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import com.cxs.entity.Register;
import com.cxs.utils.DBCPUtils;

public class RegisterDao {
	//×¢²á·½·¨
	public Register register(Register register){
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		//	String s ="delete from  Student where id=? and name=? and sex=? and classes=?";
		String	sql1 = "insert into customer (ctel,cpsd) values(?,?)";

			
			try{
				runner.update(sql1,register.getCtel(),register.getCpsd());
				
			}catch(SQLException e) {
				e.printStackTrace();
	  }
			return register;
		
		
	}
}
