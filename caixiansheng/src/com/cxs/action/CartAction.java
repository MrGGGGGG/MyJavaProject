package com.cxs.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.cxs.service.CartService;
import com.cxs.entity.Cart;
import com.cxs.entity.Product;
@SuppressWarnings("serial")
public class CartAction extends SuperAction {

	//2������service�����ɶ���
	private CartService cartService  = new CartService ();
	
	//���빺�ﳵ
	public String Cart(){
		System.out.println("ִ����Cart����");
	
		
		String cid=session.getAttribute("userid").toString();//��ȡ�û�ID	
		System.out.println(cid);
		
		String pid=request.getParameter("pid");				//��ȡũ��ƷID
		System.out.println(pid);
		
		System.out.println(session.getAttribute("userinfo"));
		
		
		if(session.getAttribute("userinfo")!=null){
			
			cartService.cart(cid,pid,cid);
			
			return "success";
		}
		else{
			return "fail";
		}
	}

	//��ʾ���ﳵҳ��
	public String selectcart(){
		//��ȡ�û�ID	
		
		if(session.getAttribute("userid").toString()!=null){
			String cid=session.getAttribute("userid").toString();
			List<Product> list = new ArrayList<Product>();
			list=cartService.selectcart(cid);
			session.setAttribute("cartlist", list);
			
			return "showcart";
		}
		else{
			return "fail";
		}
	}
	
	//ɾ�����ﳵ�е�ĳ��
	public String deletecart(){
		String pid=request.getParameter("pid");
		String cid= session.getAttribute("userid").toString();
		System.out.println(pid);
		System.out.println(cid);
		cartService.deletecart(pid, cid);	
		return null;
		
	}
}
