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
	 * 注册第二步
	 * @param u
	 * @return
	 */
	public int addUser_second(UserModel u){
		return ud.insert_second_step(u);
	}
	
	/**
	 * 根据账号查询用户
	 */
	public UserModel findUserByAccoutn(String account){
		return ud.selectUserByAccount(account);
	}
	
	/**
	 * 根据账号删除用户
	 * @param idcard
	 * @return
	 */
	public int removeUserByAccount(String account){
		return ud.deleteUserByAccount(account);
	}
	
	/**
	 * 根据身份证信息修改用户状态
	 * @param state
	 * @param idcard
	 * @return
	 */
	public int alterUserStateByIdCadr(int state,String idcard){
		return ud.updateUserStateByIdcard(state,idcard);
	}
	
	@Override
	public int add(UserModel model) {
		return ud.insert(model);
	}
	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int alterById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
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
