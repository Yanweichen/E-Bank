package com.bank.dao.msg;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.msg.MsgModel;

public interface MsgDAO extends BaseDAO<MsgModel> {

	public List<MsgModel> selectMsgByState(String state);
	public int updateMsgState(int id);
	public int selectNumByState(String state);
}
