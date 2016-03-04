package com.bank.dao.trade;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.other.TradePage;
import com.bank.model.trade.TradeModel;

public interface TradeDAO extends BaseDAO<TradeModel>{
	
	public List<TradeModel> selectTradeByPage(TradePage tp);
	public int selectTradeCountByUser(TradePage tp);
	public int selectTradeTypeCount(int type,int id);
}
