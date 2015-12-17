package com.bank.dao.user;

import com.bank.base.BaseDAO;
import com.bank.model.user.UserModel;

public interface UserDAO extends BaseDAO<UserModel>{

	public int insert_first_step(UserModel user);
	public int insert_second_step(UserModel user);
	public UserModel selectUserByIdCard(String idcard);
	public int deleteUserByIdcard(String idcard);
	public int updateUserStateByIdcard(int state,String idcard);
}
