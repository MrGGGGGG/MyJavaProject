package com.cxs.entity;

public class Message {
	private int message_id;
	private int cid;
	private String cname;
	private String message_text;
	private String message_time;
	private String message_img;
	private int message_zan;
	public Message(){
		
	}
	public Message(int message_id, int cid,String cname, String message_text,String message_time, String message_img, int message_zan) {
		super();
		this.message_id = message_id;
		this.cid = cid;
		this.cname = cname;
		this.message_text = message_text;
		this.message_time = message_time;
		this.message_img = message_img;
		this.message_zan = message_zan;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getMessage_text() {
		return message_text;
	}
	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}
	public String getMessage_img() {
		return message_img;
	}
	public void setMessage_img(String message_img) {
		this.message_img = message_img;
	}
	public int getMessage_zan() {
		return message_zan;
	}
	public void setMessage_zan(int message_zan) {
		this.message_zan = message_zan;
	}
	public String getMessage_time() {
		return message_time;
	}
	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", cid=" + cid + ", cname=" + cname + ", message_text="
				+ message_text + ", message_time=" + message_time + ", message_img=" + message_img + ", message_zan="
				+ message_zan + "]";
	}
	

	
	
	
}
