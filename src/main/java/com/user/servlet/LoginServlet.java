package com.user.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;


public class LoginServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			
			String password=req.getParameter("password");
			System.out.println("Login successfully.....");
			
			if("Maverick@gmail.com".equals(email) && "123456".equals(password)) {
				User us=new User();
				us.setName("Maverick");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				
			User us=dao.login(email, password);
			if(us!=null) {
				session.setAttribute("userobj", us);
				resp.sendRedirect("index.jsp");
			}else {
				session.setAttribute("faildMsg", "email & password invalid.....");
				resp.sendRedirect("login.jsp");
			}
				
				resp.sendRedirect("home.jsp");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
