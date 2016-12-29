package com.cxs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cxs.entity.Evaluate;
import com.cxs.utils.DBCPUtils;

public class EvaluateDao {
	public List<Evaluate> selecteva(String epid){
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		String sql2="SELECT * FROM Evaluate WHERE  epid=? order by evdate desc";
		List<Evaluate> list = null;
		// 结果集处理器
		ResultSetHandler<List<Evaluate>> h = new BeanListHandler<Evaluate>(
				Evaluate.class);
		try {
			list =runner.query(sql2, h,epid);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public String publisheva(String evid,String econt,String evdate,String epid){
		QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
		String sql = "insert into evaluate values(?,?,?,?)";
		try{
			runner.update(sql, evid,econt,evdate,epid);
		}catch  (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
		
	}
}
