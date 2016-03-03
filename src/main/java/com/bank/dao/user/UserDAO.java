package com.bank.dao.user;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.other.Page;
import com.bank.model.user.UserModel;

public interface UserDAO extends BaseDAO<UserModel>{

	public int insert_first_step(UserModel user);
	public int insert_second_step(UserModel user);
	public UserModel selectUserByAccount(String account);
	public int deleteUserByAccount(String account);
	public int updateUserStateByIdcard(int state,String idcard);
	public double selectUserMoneyById(int id);
	public double selectUserBalanceById(int id);
	public int updateUserBalanceById(double money,int id);
	public int updateUserMoneyById(double money,int id);
	public List<UserModel> selectRecentlyTradeUser(int id);
	public UserModel selecUserByCardNum(String num);
	public int selectAllCount(Page p);
	public List<UserModel> selectUserByPage(Page p);
}
