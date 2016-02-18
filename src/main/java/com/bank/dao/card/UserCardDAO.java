package com.bank.dao.card;

import com.bank.base.BaseDAO;
import com.bank.model.card.UserCardModel;

public interface UserCardDAO extends BaseDAO<UserCardModel> {

	public int updateCardStateById(Integer id,Integer state);
}
