package com.bank.service.card;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.card.CardCheckDAO;
import com.bank.model.card.CardCheckModel;
import com.bank.model.card.CheckUserAndCardModel;
import com.bank.model.other.Page;

@Service
public class CardCheckService implements BaseService<CardCheckModel> {

	@Autowired
	private CardCheckDAO ccd;
	
	
	public List<CheckUserAndCardModel> findCheckUserAndCardAll(Page p){
		return ccd.selectCheckUserAndCardAll(p);
	} 
	
	public int findCheckUserAndCardNum(){
		return ccd.selectCheckUserAndCardNum();
	}
	
	@Override
	public int add(CardCheckModel model) {
		// TODO Auto-generated method stub
		return ccd.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return ccd.deleteById(id);
	}

	@Override
	public int alterById(CardCheckModel model) {
		// TODO Auto-generated method stub
		return ccd.updateById(model);
	}

	@Override
	public CardCheckModel findById(Integer id) {
		// TODO Auto-generated method stub
		return ccd.selectById(id);
	}

	@Override
	public List<CardCheckModel> findAll() {
		// TODO Auto-generated method stub
		return ccd.selectAll();
	}

}
