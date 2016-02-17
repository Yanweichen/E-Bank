package com.bank.service.card;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.card.CardDAO;
import com.bank.model.card.CardModel;

@Service
public class CardService implements BaseService<CardModel>{

	@Autowired
	private CardDAO cd;
	
	@Override
	public int add(CardModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(CardModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CardModel findById(Integer id) {
		// TODO Auto-generated method stub
		return cd.selectById(id);
	}

	@Override
	public List<CardModel> findAll() {
		// TODO Auto-generated method stub
		return cd.selectAll();
	}

	
}
