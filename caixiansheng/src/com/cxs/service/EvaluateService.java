package com.cxs.service;

import java.util.ArrayList;
import java.util.List;

import com.cxs.dao.EvaluateDao;
import com.cxs.entity.Evaluate;
import com.cxs.entity.Product;

public class EvaluateService {
	private EvaluateDao evadao = new EvaluateDao();
	public List<Evaluate> selecteva(String epid){
		List<Evaluate> list = new ArrayList<Evaluate>();
		try {
			list=evadao.selecteva(epid);
		}catch (Exception e) {
			throw new RuntimeException(e);
	}
		return list;
	}
	public String publisheva(String evid,String econt,String evdate,String epid){
		
		try {
			evadao.publisheva(evid,econt,evdate,epid);
		}catch (Exception e) {
			throw new RuntimeException(e);
	}
		return null;
		
	}
}
