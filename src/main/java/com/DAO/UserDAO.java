package com.DAO;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	public boolean CheckPassword(int id,String pss);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
