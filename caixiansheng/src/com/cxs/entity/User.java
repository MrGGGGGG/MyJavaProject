package com.cxs.entity;

import java.util.Date;

public class User {
	private int cid;
	private String cpsd;
	private String cname;
	private String chead;
	private String ctel;
	private String cEmail;
	private String csex;
	private Date cdate;
	public User(){
		
	}
	public User(int cid, String cpsd, String cname, String chead, String ctel, String cEmail, String csex, Date cdate) {
		super();
		this.cid = cid;
		this.cpsd = cpsd;
		this.cname = cname;
		this.chead = chead;
		this.ctel = ctel;
		this.cEmail = cEmail;
		this.csex = csex;
		this.cdate = cdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCpsd() {
		return cpsd;
	}
	public void setCpsd(String cpsd) {
		this.cpsd = cpsd;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getChead() {
		return chead;
	}
	public void setChead(String chead) {
		this.chead = chead;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getCsex() {
		return csex;
	}
	public void setCsex(String csex) {
		this.csex = csex;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	@Override
	public String toString() {
		return "User [cid=" + cid + ", cpsd=" + cpsd + ", cname=" + cname + ", chead=" + chead + ", ctel=" + ctel
				+ ", cEmail=" + cEmail + ", csex=" + csex + ", cdate=" + cdate + "]";
	}
	
	
	
}
