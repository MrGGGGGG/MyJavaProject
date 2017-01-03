package com.cxs.entity;

import java.util.Date;

public class Product {
	private int pid;
	private String pname;
	private String pintro;
	private int pcount;
	private double price;
	private String picture;
	private String pdate;
	private int fid;
	private int typeid;
	private int syid;
	
	public Product(){
		
	}
	
	
	public Product(int pid, String pname, String pintro, int pcount, double price, String picture, String pdate, int fid,
			int typeid, int syid) {
		//super();
		this.pid = pid;
		this.pname = pname;
		this.pintro = pintro;
		this.pcount = pcount;
		this.price = price;
		this.picture = picture;
		this.pdate = pdate;
		this.fid = fid;
		this.typeid = typeid;
		this.syid = syid;
	}


	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPintro() {
		return pintro;
	}

	public void setPintro(String pintro) {
		this.pintro = pintro;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public int getSyid() {
		return syid;
	}

	public void setSyid(int syid) {
		this.syid = syid;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pintro=" + pintro + ", pcount=" + pcount + ", price="
				+ price + ", picture=" + picture + ", pdate=" + pdate + ", fid=" + fid + ", typeid=" + typeid
				+ ", syid=" + syid + "]";
	}
	
}
