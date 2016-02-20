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
	public List<MsgModel> findMsgByState(String state,int offset,int limit,int uid){
		return md.selectMsgByState(state,offset,limit,uid);
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
	public int findNumByState(String state,int uid){
		return md.selectNumByState(state,uid);
	}
	
	/**
	 * 查询新消息
	 * @return
	 */
	public MsgModel findNewMsg(int uid){
		return md.selectNewMsg(uid);
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public int removeByIdArray(int [] ids){
		return md.deleteByArray(ids);
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
