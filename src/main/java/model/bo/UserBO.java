package model.bo;

import java.util.ArrayList;

import model.dao.UserDAO;
import model.bean.User;

public class UserBO {
	UserDAO userDao = new UserDAO();
	public boolean isValidUser(String username, String password) {
		return userDao.isExistUser(username, password);
	}
	public int register(User user) {
		return userDao.AddUser(user);
	}

}
