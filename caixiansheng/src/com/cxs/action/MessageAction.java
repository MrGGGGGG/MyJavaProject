package com.cxs.action;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.iterators.ReverseListIterator;

import com.cxs.entity.Message;
import com.cxs.entity.User;
import com.cxs.service.FriendService;
import com.cxs.service.MessageService;

public class MessageAction extends SuperAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String message_text;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public String getMessage_text() {
		return message_text;
	}
	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}
	private MessageService messageservice = new MessageService();
	private FriendService friendservice = new FriendService();
	/**
	 * ������̬�ķ���
	 */
	public String createnewmessage(){
		System.out.println("�����˶�̬����");
		//Message msg = (Message)session.getAttribute("msg");
		Message msg  = new Message();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println("��������ݣ�"+ message_text);
		System.out.println(pic1);
		System.out.println(pic2);
		System.out.println(pic3);
		msg.setMessage_time(sdf.format(new Date()));
		msg.setCid((Integer)session.getAttribute("userid"));
		msg.setCname((String)session.getAttribute("userinfo"));
		msg.setMessage_text(message_text);
		msg.setMessage_img(pic1);
		boolean iscreate = messageservice.doCreate(msg);
		if(iscreate == true){
			showAllMessagesById();
			return "createmessagesuccess";
		}else{
			return "createmessagefaild";
		}
	}
	
	/**
	 * ��ʾ���Ѷ�̬�ķ���
	 */
	public String showAllMessagesById(){
		List<User> list = friendservice.getFriendList((Integer)session.getAttribute("userid"));
		Iterator<User> iter = list.iterator();
		Set<Integer> st = new HashSet<Integer>();
		while(iter.hasNext()){
			st.add(iter.next().getCid());//��User�б���û�id�Ž�set���档
		}
		st.add((Integer)session.getAttribute("userid"));
		List<Message> lstmess = messageservice.showAllFriendMessage(st);
		Collections.reverse(lstmess);
		session.setAttribute("friendmessage", lstmess);
		return "showfriendmessage";
	}
}
