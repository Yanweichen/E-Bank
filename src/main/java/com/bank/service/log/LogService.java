package com.bank.service.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.log.LogDAO;
import com.bank.model.log.LogModel;
import com.bank.model.other.TradePage;

@Service
public class LogService implements BaseService<LogModel>{

	@Autowired
	private LogDAO ld;
	
	public List<LogModel> findAllByPage(TradePage tp){
		return ld.selectAllByPage(tp);
	}
	
	public int findAllCountByPage(TradePage tp){
		return ld.selectAllCountByPage(tp);
	}
	
	@Override
	public int add(LogModel model) {
		// TODO Auto-generated method stub
		return ld.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(LogModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LogModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LogModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
