package com.cxs.action;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.cxs.service.CartService;
import com.cxs.entity.Cart;
import com.cxs.entity.Product;
@SuppressWarnings("serial")
public class CartAction extends SuperAction {

	//2、调用service，生成对象
	private CartService cartService  = new CartService ();
	
	//加入购物车
	public String Cart(){
		System.out.println("执行了Cart方法");
	
		
		String cid=session.getAttribute("userid").toString();//获取用户ID	
		System.out.println(cid);
		
		String pid=request.getParameter("pid");				//获取农产品ID
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

	//显示购物车页面
	public String selectcart(){
		//获取用户ID	
		
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
	
	//删除购物车中的某项
	public String deletecart(){
		String pid=request.getParameter("pid");
		String cid= session.getAttribute("userid").toString();
		System.out.println(pid);
		System.out.println(cid);
		cartService.deletecart(pid, cid);	
		return null;
		
	}
}
