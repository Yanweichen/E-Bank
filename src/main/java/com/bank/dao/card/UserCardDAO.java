package com.bank.dao.card;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.card.UserCardListModel;
import com.bank.model.card.UserCardModel;

public interface UserCardDAO extends BaseDAO<UserCardModel> {

	public int updateCardStateById(Integer id,Integer state);
	public List<UserCardListModel> selectAllByUser(int uid);
	public double selectCardBalanceById(String cardnum);
	public int updateCardBalanceById(double money,String cardnum);
	public UserCardModel selectCardByCardNum(String num);
}
