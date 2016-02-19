package com.bank.dao.msg;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bank.base.BaseDAO;
import com.bank.model.msg.MsgModel;

public interface MsgDAO extends BaseDAO<MsgModel> {

	public List<MsgModel> selectMsgByState(@Param("state")String state,@Param("uid")int uid);
	public int updateMsgState(int id);
	public int selectNumByState(@Param("state")String state,@Param("uid")int uid);
	public MsgModel selectNewMsg();
}
