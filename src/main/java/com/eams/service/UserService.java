package com.eams.service;

import java.util.List;

import com.eams.model.User;

public interface UserService {

	public User login(User parm);
	public List<User> loginList(User param);

	public int insertUser(User param);
	
	public int delUser (User param);
	
	public int updateUser (User param);
	
	public Integer selectcountUser();


}
