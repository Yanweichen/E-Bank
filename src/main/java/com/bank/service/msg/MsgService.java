package com.bank.service.msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.msg.MsgDAO;
import com.bank.model.msg.MsgModel;

@Service
public class MsgService implements BaseService<MsgModel>{

	@Autowired
	private MsgDAO md;
	
	@Override
	public int add(MsgModel model) {
		// TODO Auto-generated method stub
		return md.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return md.deleteById(id);
	}

	/**
	 * 根据状态查询信息
	 * @param state
	 * @return
	 */
	public List<MsgModel> findMsgByState(String state){
		return md.selectMsgByState(state);
	}
	
	/**
	 * 修改状态
	 * @param id
	 * @return
	 */
	public int alertStateById(int id){
		return md.updateMsgState(id);
	}
	
	/**
	 * 查询数量
	 * @param state
	 * @return
	 */
	public int findNumByState(String state){
		return md.selectNumByState(state);
	}
	
	/**
	 * 查询新消息
	 * @return
	 */
	public MsgModel findNewMsg(){
		return md.selectNewMsg();
	}
	
	@Override
	public int alterById(MsgModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MsgModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MsgModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
