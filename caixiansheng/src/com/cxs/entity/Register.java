package com.cxs.entity;

public class Register {
	private String ctel;
	private String cpsd;
	private String checkword;
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCpsd() {
		return cpsd;
	}
	public void setCpsd(String cpsd) {
		this.cpsd = cpsd;
	}
	public String getCheckword() {
		return checkword;
	}
	public void setCheckword(String checkword) {
		this.checkword = checkword;
	}
	public Register(){
		
	}
	public Register(String ctel,String cpsd,String checkword) {
		super();
		this.ctel=ctel;
		this.cpsd=cpsd;
		this.checkword=checkword;
		
		
	}
	public Register register(Register register) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String toString() {
		return "Register [ctel=" + ctel + ", cpsd=" + cpsd + ", checkword="
				+ checkword + "]";
	}
	
	
}
