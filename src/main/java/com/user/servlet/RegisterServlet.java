package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			System.out.println(name+""+email+""+phone+""+password+""+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			
			HttpSession session =req.getSession();
			
			if(check!=null) {
				UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUser(email);
				
				if(f2) {
					boolean f =dao.userRegister(us);
					
					if(f) {
						System.out.println("User Register successfully.....");
						
						session.setAttribute("sussMsg","User Register successfully....." );
						resp.sendRedirect("login.jsp");
					}else {
						System.err.println(" somthing wrong on server.....");
						session.setAttribute("fldMsg"," somthing wrong on server....." );
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("fMsg","User Allready exist...plzzz try another Email id........");
					resp.sendRedirect("register.jsp");
					
				}
			}else {
				System.err.println(" Plzz check Agree terms & Condition.....");
				session.setAttribute("fMsg"," Plzz check Agree terms & Condition.....");
				resp.sendRedirect("register.jsp");
			}
			
			
		           }catch(Exception e) {
		        	   e.printStackTrace();
		           }
}
     
      }