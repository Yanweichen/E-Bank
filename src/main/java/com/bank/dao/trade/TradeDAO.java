package com.bank.dao.trade;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bank.base.BaseDAO;
import com.bank.model.other.OutInModel;
import com.bank.model.other.TradePage;
import com.bank.model.trade.TradeModel;

public interface TradeDAO extends BaseDAO<TradeModel>{
	
	public List<TradeModel> selectTradeByPage(TradePage tp);
	public int selectTradeCountByUser(TradePage tp);
	public OutInModel selectTradeTypeCount(@Param("type")int type,@Param("id")int id);
	public OutInModel selectALLinout(int id);
}
