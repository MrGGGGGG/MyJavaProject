package com.cxs.entity;

public class Cart {
	private String shid;
	private String shprice;
	private String shnum;
	private String pid;
	private String fid;
	private String cid;
	public String getShid() {
		return shid;
	}
	public void setShid(String shid) {
		this.shid = shid;
	}
	public String getShprice() {
		return shprice;
	}
	public void setShprice(String shprice) {
		this.shprice = shprice;
	}
	public String getShnum() {
		return shnum;
	}
	public void setShnum(String shnum) {
		this.shnum = shnum;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Cart(){
		
	}
	public Cart(String shid,String shprice,String shnum,String pid,String fid,String cid){
		super();
		this.shid=shid;
		this.shprice=shprice;
		this.shnum=shnum;
		this.pid=pid;
		this.fid=fid;
		this.cid=cid;
	}
	public Cart cart(Cart cart){
		return null;
	}
}
