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

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			
			HttpSession session=req.getSession();
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.CheckPassword(id, password);
			
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {

					session.setAttribute("succMsg","Edit Profile successfully....." );
					resp.sendRedirect("edit_profile.jsp");
				}else {

					session.setAttribute("faildMsg","Something wrong on server....." );
					resp.sendRedirect("edit_profile.jsp");
				}
			}else {

				session.setAttribute("faildMsg","Your password is incorrect....." );
				resp.sendRedirect("edit_profile.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
