package com.cxs.entity;

public class Order {
	private String onumber;
	private String pname;
	private int ocount;
	private double oprice;
	private String ostatus;
	private String odate;
	private String oaddress;
	private String olog;
	private int evid;
	private int cid;
	private int pid;
	public Order(){
	}

	public Order(String onumber, String pname,int ocount, double oprice, String ostatus, String odate, String oaddress,
			String olog, int evid, int cid, int pid) {
		super();
		this.onumber = onumber;
		this.pname = pname;
		this.oprice = oprice;
		this.ocount = ocount;
		this.ostatus = ostatus;
		this.odate = odate;
		this.oaddress = oaddress;
		this.olog = olog;
		this.evid = evid;
		this.cid = cid;
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getOnumber() {
		return onumber;
	}

	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}

	public double getOprice() {
		return oprice;
	}

	public void setOprice(double oprice) {
		this.oprice = oprice;
	}

	public String getOdate() {
		return odate;
	}
	
	public String getOstatus() {
		return ostatus;
	}
	

	public int getOcount() {
		return ocount;
	}

	public void setOcount(int ocount) {
		this.ocount = ocount;
	}

	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}


	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOlog() {
		return olog;
	}

	public void setOlog(String olog) {
		this.olog = olog;
	}

	public int getEvid() {
		return evid;
	}

	public void setEvid(int evid) {
		this.evid = evid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getOaddress() {
		return oaddress;
	}



	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}

	@Override
	public String toString() {
		return "Order [onumber=" + onumber + ", pname=" + pname + ", ocount=" + ocount + ", oprice=" + oprice
				+ ", ostatus=" + ostatus + ", odate=" + odate + ", oaddress=" + oaddress + ", olog=" + olog + ", evid="
				+ evid + ", cid=" + cid + ", pid=" + pid + "]";
	}

}
