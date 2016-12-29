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
	
	public String getMessage_text() {
		return message_text;
	}
	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}
	private MessageService messageservice = new MessageService();
	private FriendService friendservice = new FriendService();
	/**
	 * 发布动态的方法
	 */
	public String createnewmessage(){
		System.out.println("调用了动态方法");
		//Message msg = (Message)session.getAttribute("msg");
		Message msg  = new Message();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println("发表的内容："+ message_text);
		msg.setMessage_time(sdf.format(new Date()));
		msg.setCid((Integer)session.getAttribute("userid"));
		msg.setCname((String)session.getAttribute("userinfo"));
		msg.setMessage_text(message_text);
		boolean iscreate = messageservice.doCreate(msg);
		if(iscreate == true){
			showAllMessagesById();
			return "createmessagesuccess";
		}else{
			return "createmessagefaild";
		}
	}
	
	/**
	 * 显示好友动态的方法
	 */
	public String showAllMessagesById(){
		List<User> list = friendservice.getFriendList((Integer)session.getAttribute("userid"));
		Iterator<User> iter = list.iterator();
		Set<Integer> st = new HashSet<Integer>();
		while(iter.hasNext()){
			st.add(iter.next().getCid());//将User列表的用户id放进set里面。
		}
		st.add((Integer)session.getAttribute("userid"));
		List<Message> lstmess = messageservice.showAllFriendMessage(st);
		Collections.reverse(lstmess);
		session.setAttribute("friendmessage", lstmess);
		return "showfriendmessage";
	}
}
