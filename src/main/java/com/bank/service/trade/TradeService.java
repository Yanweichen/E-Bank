package com.bank.service.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bank.base.BaseService;
import com.bank.dao.trade.TradeDAO;
import com.bank.model.msg.MsgModel;
import com.bank.model.trade.TradeModel;
import com.bank.model.user.UserModel;
import com.bank.service.card.UserCardService;
import com.bank.service.msg.MsgService;
import com.bank.service.user.UserService;
import com.bank.utils.RegularUtil;

@Service
public class TradeService implements BaseService<TradeModel>{

	@Autowired
	private TradeDAO td;
	@Autowired
	private UserService us;
	@Autowired
	private MsgService ms;
	@Autowired
	private UserCardService ucs;
	
	/**
	 * 根据E宝转账
	 * @param user
	 * @param touser
	 * @param tradeinfo
	 * @param trademoney
	 * @return
	 */
	@Transactional
	public boolean trade(UserModel user,String touser,String tradeinfo,double trademoney){
		try {
			UserModel um =  us.findUserByAccoutn(touser);
			us.alertUserMoneyById(user.getUser_account_money()-trademoney, Integer.valueOf(user.getUser_id()));//本方减钱
			us.alertUserMoneyById(um.getUser_account_money()+trademoney, Integer.valueOf(um.getUser_id()));//对方加钱
			TradeModel tm = new TradeModel();
			tm.setTradeInfo(tradeinfo);
			tm.setTradeNumber(""+System.currentTimeMillis());
			tm.setTradeUserId(Integer.valueOf(user.getUser_id()));
			tm.setTradeOtherUserId(Integer.valueOf(um.getUser_id()));
			tm.setTradeState(1);//1正常2失败
			tm.setTradeType(RegularUtil.USERTRADE);//
			tm.setTradeExpendMoney(trademoney);
			tm.setTradeIncomeMoney(0);
			add(tm);//转账方添加交易记录
			tm.setTradeUserId(Integer.valueOf(um.getUser_id()));
			tm.setTradeOtherUserId(Integer.valueOf(user.getUser_id()));
			tm.setTradeExpendMoney(0);
			tm.setTradeIncomeMoney(trademoney);
			add(tm);//被转帐方添加交易记录
			MsgModel mm = new MsgModel();
			mm.setMsgState(false);
			mm.setMsgUserId(Integer.valueOf(um.getUser_id()));
			mm.setMsgType(3);
			mm.setMsgTitle("您收到一笔来自"+user.getUser_name()+"的款项！");
			String content = "金额共"+trademoney+"元人民币,详情请查看您的交易记录";
			if (tradeinfo!=null) {
				content +=",并且<div class='gray6'>"+user.getUser_name()+"<div>还对您说:<div class='gray6'>"+tradeinfo+"<div>";
			}
			mm.setMsgContent(content);
			ms.add(mm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * 根据卡转账
	 * @param user
	 * @param cardnum
	 * @param touser
	 * @param tradeinfo
	 * @param trademoney
	 * @return
	 */
	@Transactional
	public boolean trade(UserModel user,String cardnum,String touser,String tradeinfo,double trademoney){
		try {
			UserModel um =  us.findUserByAccoutn(touser);
			ucs.alertCardBalanceById(trademoney, cardnum);//本方卡减钱
			us.alertUserMoneyById(um.getUser_account_money()+trademoney, Integer.valueOf(um.getUser_id()));//对方加钱
			TradeModel tm = new TradeModel();
			tm.setTradeInfo(tradeinfo);
			tm.setTradeNumber(""+System.currentTimeMillis());
			tm.setTradeUserId(Integer.valueOf(user.getUser_id()));
			tm.setTradeOtherUserId(Integer.valueOf(um.getUser_id()));
			tm.setTradeState(1);//1正常2失败
			tm.setTradeType(RegularUtil.USERTRADE);//
			tm.setTradeExpendMoney(trademoney);
			tm.setTradeIncomeMoney(0);
			add(tm);//转账方添加交易记录
			tm.setTradeUserId(Integer.valueOf(um.getUser_id()));
			tm.setTradeOtherUserId(Integer.valueOf(user.getUser_id()));
			tm.setTradeExpendMoney(0);
			tm.setTradeIncomeMoney(trademoney);
			add(tm);//被转帐方添加交易记录
			MsgModel mm = new MsgModel();
			mm.setMsgState(false);
			mm.setMsgUserId(Integer.valueOf(um.getUser_id()));
			mm.setMsgType(3);
			mm.setMsgTitle("您收到一笔来自"+user.getUser_name()+"的款项！");
			String content = "金额共"+trademoney+"元人民币,详情请查看您的交易记录";
			if (tradeinfo!=null) {
				content +=",并且<div class='gray6'>"+user.getUser_name()+"<div>还对您说:<div class='gray6'>"+tradeinfo+"<div>";
			}
			mm.setMsgContent(content);
			ms.add(mm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public int add(TradeModel model) {
		// TODO Auto-generated method stub
		return td.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(TradeModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TradeModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TradeModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
