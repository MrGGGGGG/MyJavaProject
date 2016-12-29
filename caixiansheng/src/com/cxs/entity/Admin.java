package com.cxs.entity;

public class Admin {
	private String adminid;
	private String adminpassword;
	private String adminname;
	public Admin(){
		
	}
	public Admin(String adminid, String adminpassword, String adminname) {
		super();
		this.adminid = adminid;
		this.adminpassword = adminpassword;
		this.adminname = adminname;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	
}
