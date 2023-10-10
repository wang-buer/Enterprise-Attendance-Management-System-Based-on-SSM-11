package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.UserDao;
import com.eams.model.User;
import com.eams.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	public User login(User param) {
		
		return userDao.login(param);
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public List<User> loginList(User param) {

		return userDao.loginList(param);
	}
	public int insertUser(User param) {

		return userDao.insertUser(param);
	}
	public int delUser(User param) {

		return userDao.delUser(param);
	}
	public int updateUser(User param) {

		return userDao.updateUser(param);
	}
	public Integer selectcountUser() {

		return userDao.selectcountUser();
	}
	

	
}
