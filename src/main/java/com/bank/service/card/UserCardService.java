package com.bank.service.card;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.card.UserCardDAO;
import com.bank.model.card.UserCardModel;

@Service
public class UserCardService implements BaseService<UserCardModel> {

	@Autowired
	private UserCardDAO ucd;
	
	@Override
	public int add(UserCardModel model) {
		// TODO Auto-generated method stub
		return ucd.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(UserCardModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserCardModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserCardModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
