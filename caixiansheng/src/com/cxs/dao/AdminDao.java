package com.cxs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Admin;
import com.cxs.utils.DBCPUtils;

public class AdminDao {
	//登录方法
		public Admin login(Admin admin){
			String sql = "select * from admin where adminid=? and adminpassword=?";
			QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
			List<Admin> list = null;
			// 结果集处理器
			ResultSetHandler<List<Admin>> h = new BeanListHandler<Admin>(
					Admin.class);
			try {
				list =runner.query(sql, h,admin.getAdminid(),admin.getAdminpassword());
				if(list.size()>0){
					return list.get(0);
				}else{
					return null;
				}
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
}
