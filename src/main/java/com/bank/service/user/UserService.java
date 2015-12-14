package com.bank.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.user.UserDAO;
import com.bank.model.user.UserModel;

@Service
public class UserService implements BaseService<UserModel> {

	@Autowired
	private UserDAO ud;
	
	/**
	 * 注册第一步
	 * @param u
	 * @return
	 */
	public int addUser_first(UserModel u){
		return ud.insert_first_step(u);
	}
	
	/**
	 * 验证身份证信息
	 */
	public UserModel verifyIdCard(String idcard){
		return ud.selectUserByIdCard(idcard);
	}
	
	@Override
	public void add(UserModel model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void RemoveById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void alterById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
