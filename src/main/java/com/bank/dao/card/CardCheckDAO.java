package com.bank.dao.card;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.card.CardCheckModel;
import com.bank.model.card.CheckUserAndCardModel;
import com.bank.model.other.Page;

public interface CardCheckDAO extends BaseDAO<CardCheckModel> {

	public List<CheckUserAndCardModel> selectCheckUserAndCardAll(Page p);
	public int selectCheckUserAndCardNum();
}
