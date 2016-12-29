package com.cxs.entity;

public class Evaluate {
	private int evid;
	private String econt;
	private String evdate;
	private String epid;
	public String getEpid() {
		return epid;
	}
	public void setEpid(String epid) {
		this.epid = epid;
	}
	public int getEvid() {
		return evid;
	}
	public void setEvid(int evid) {
		this.evid = evid;
	}
	public String getEcont() {
		return econt;
	}
	public void setEcont(String econt) {
		this.econt = econt;
	}
	public String getEvdate() {
		return evdate;
	}
	public void setEvdate(String evdate) {
		this.evdate = evdate;
	}
	public Evaluate(){
		
	}
	public  Evaluate(int evid,String econt,String evdate,String epid){
		super();
		this.evid=evid;
		this.econt=econt;
		this.evdate=evdate;
		this.epid=epid;
		
	}
}
