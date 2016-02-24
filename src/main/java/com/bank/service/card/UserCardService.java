package com.bank.service.card;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.bank.base.BaseService;
import com.bank.dao.card.UserCardDAO;
import com.bank.model.card.UserCardListModel;
import com.bank.model.card.UserCardModel;
import com.bank.model.msg.MsgModel;
import com.bank.service.msg.MsgService;
import com.bank.utils.RegularUtil;

@Service
public class UserCardService implements BaseService<UserCardModel> {

	@Autowired
	private UserCardDAO ucd;
	@Autowired
	private CardCheckService ccs;//审核办卡的操作
	@Autowired
	private MsgService ms;//消息操作
	
	@Override
	public int add(UserCardModel model) {
		// TODO Auto-generated method stub
		return ucd.insert(model);
	}
	
	/**
	 * 根据id修改卡的状态
	 * @param id
	 * @param state
	 * @return
	 */
	public int alertCardStateById(Integer id,Integer state){
		return ucd.updateCardStateById(id, state);
	}

	/**
	 * 拒绝办卡
	 * @param user_id
	 * @param card_id
	 * @param title
	 * @param content
	 * @return
	 */
	@Transactional
	public JSONObject rejectOpenCard(int user_id,int card_id,String title,String content){
		JSONObject jo = new JSONObject();
		int suc = ccs.RemoveById(card_id);//删除审核记录
		if (suc==1) {
			MsgModel mm = new MsgModel();
			mm.setMsgState(false);//未阅读消息
			mm.setMsgTitle(title);
			mm.setMsgContent(content);
			mm.setMsgType(3);//1 公告 2 活动 3 通知
			mm.setMsgUserId(user_id);
			mm.setMsgTime(new Date());
			suc = ms.add(mm);//给用户发送信息
			if (suc==1) {
				suc = alertCardStateById(card_id,RegularUtil.NOCHECK);//修改卡片为未通过
				if (suc==1) {
					jo.put("error", "200");
					jo.put("msg", "拒绝办卡成功");
				}else{
					jo.put("error", "200");
					jo.put("msg", "删除卡片失败");
				}
			} else {
				jo.put("error", "203");
				jo.put("msg", "发送拒绝信息失败");
			}
			throw new RuntimeException("测试异常");
		} else {
			jo.put("error", "203");
			jo.put("msg", "删除审核失败！");
		}
		return jo;
	}
	
	/**
	 * 返回用户所有的卡片
	 * @param uid
	 * @return
	 */
	public List<UserCardListModel> findAllByUser(int uid){
		return ucd.selectAllByUser(uid);
	}
	
	/**
	 * 根据id修改卡余额
	 * @param money
	 * @param id
	 * @return
	 */
	public int alertCardBalanceById(double money,String id){
		return ucd.updateCardBalanceById(money, id);
	}
	
	/**
	 * 根据id查询卡余额
	 * @param money
	 * @param id
	 * @return
	 */
	public double selectCardBalanceById(String cardnum){
		return ucd.selectCardBalanceById(cardnum);
	}
	
	/**
	 * 根据卡号查询卡
	 * @param num
	 * @return
	 */
	public UserCardModel findCardByCardNum(String num){
		return ucd.selectCardByCardNum(num);
	}
	
	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return ucd.deleteById(id);
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
