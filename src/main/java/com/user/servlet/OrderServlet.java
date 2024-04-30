package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			HttpSession session =req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("useremail");
			String phone=req.getParameter("userphone");
			String address=req.getParameter("useraddress");
			String landmark=req.getParameter("userlandmark");
			String city=req.getParameter("usercity");
			String state=req.getParameter("userstate");
			String pincode=req.getParameter("userpincode");
			String paymentType=req.getParameter("userpaymenttype");
			
			String fullAddress=address+","+landmark+","+city+","+state+","+pincode;
			
			System.out.println(name+","+email+","+phone+","+fullAddress+","+paymentType);
			
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> cart=dao.getBookByUser(id);
			
			if(cart.isEmpty()) {
				session.setAttribute("failedMsg","Add Item....");
			resp.sendRedirect("checkout.jsp");
				
			}else {
				BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
				Random r= new Random();
					
					BookOrder o=null;
					
					ArrayList<BookOrder> orderlist=new ArrayList<BookOrder>();
					
					for(Cart c:cart) {
						System.out.println(c.getBookName()+","+c.getAuthor()+","+c.getPrice());
						
						
						o=new BookOrder();
						
						o.setOrder_id("Book-ORD-00"+r.nextInt(10000));
						o.setUserName(name);
						o.setEmail(email);
						o.setPhone(phone);
						o.setFullAddress(fullAddress);
						o.setBookName(c.getBookName());
						o.setAuthor(c.getAuthor());
						o.setPrice(c.getPrice()+"");
						o.setPaymentType(paymentType);
						
						orderlist.add(o);
						
						
					}
					
					if("noselect".equals(paymentType)) {
						session.setAttribute("failedMsg","please choose Payment method.....");
						
						resp.sendRedirect("checkout.jsp");
					}else {
						boolean f=dao2.saveOrder(orderlist);
						if(f) {
							resp.sendRedirect("order_success.jsp");
							
							System.out.println("Order success..");
						}else {
							System.out.println("Failed Order...");
							
							session.setAttribute("failedMsg","your order failed........");
							
							resp.sendRedirect("checkout.jsp");
						}
					}
					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
