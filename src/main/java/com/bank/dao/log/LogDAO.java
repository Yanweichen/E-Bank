package com.bank.dao.log;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.log.LogModel;
import com.bank.model.other.TradePage;

public interface LogDAO extends BaseDAO<LogModel>{
	public List<LogModel> selectAllByPage(TradePage tp);
	public int selectAllCountByPage(TradePage tp);
}
