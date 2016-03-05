package com.bank.controller.trade;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.other.TradePage;
import com.bank.model.user.UserModel;
import com.bank.service.trade.TradeService;
import com.bank.service.user.UserService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("/trade")
public class TradeController {

	@Autowired
	private TradeService ts;
	@Autowired
	private UserService us;
	
	/**
	 * 余额转余额
	 * @param touser
	 * @param tradeinfo
	 * @param trademoney
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tradeBlancetoBlance")
	public JSONObject tradeBlancetoBlance(String touser,String tradeinfo,double trademoney,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.trade(user, touser, tradeinfo, trademoney);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	/**
	 * 卡转余额
	 * @param touser
	 * @param cardnum
	 * @param tradeinfo
	 * @param trademoney
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tradeByCardtoBlance")
	public JSONObject tradeByCardtoBlance(String touser,String cardnum,String tradeinfo,double trademoney,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.trade(user, cardnum, touser, tradeinfo, trademoney);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	
	/**
	 * 卡转卡
	 * @param touser
	 * @param cardnum
	 * @param tradeinfo
	 * @param trademoney
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tradeByCardtoCard")
	public JSONObject tradeByCardtoCard(String usercardnum,String tocardnum,String cardtradeinfo,double cardtrademoney,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		if (usercardnum.equals(tocardnum)) {
			jo.put("error", 203);
			jo.put("msg", "同一张卡不能转账！");
			return jo;
		}
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		jo = ts.tradeCard(user, usercardnum, tocardnum, cardtradeinfo, cardtrademoney);
		return jo;
	}
	
	/**
	 * 余额转卡
	 * @param touser
	 * @param cardnum
	 * @param tradeinfo
	 * @param trademoney
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tradeByBlancetoCard")
	public JSONObject tradeByBlancetoCard(String tocardnum,String cardtradeinfo,double cardtrademoney,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.tradeCard(user, tocardnum,cardtradeinfo, cardtrademoney);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	
	/**
	 * 转出或转入
	 * @param ebaooryuebao 转 出/入 到 余额宝(true)/余额(false)
	 * @param corborm 金额来源 银行卡/余额/余额宝
	 * @param trademoney 金额
	 * @param tradeinfo 备注
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tradeIn")
	public JSONObject tradeIn(boolean ebaooryuebao,boolean corborm,String cardnum,double trademoney,String tradeinfo,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.tradeIn(user, ebaooryuebao, corborm,cardnum, trademoney, tradeinfo);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/tradeOut")
	public JSONObject tradeOut(boolean ebaooryuebao,String cardnum,double outtrademoney,String outtradeinfo,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.tradeOut(user, ebaooryuebao,cardnum, outtrademoney, outtradeinfo);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	
	/**
	 * 获取交易记录
	 * @param tp
	 * @param req
	 * @return
	 * @throws ParseException 
	 * @throws NumberFormatException 
	 */
	@ResponseBody
	@RequestMapping("/gettradelist")
	public JSONObject getTradeList(TradePage tp,HttpServletRequest req) throws NumberFormatException, ParseException{
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		tp.setUid(Integer.valueOf(user.getUser_id()));
		return JsonUtil.getTradeList(ts.selectTradeCountByUser(tp),ts.findTradeByPage(tp)) ;
	}
	
	/**
	 * 获取相关交易用户
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getRecentlyTradeUser")
	public JSONObject getRecentlyTradeUser(HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		return JsonUtil.getRecentlyTradeUser(us.findRecentlyTradeUser(Integer.valueOf(user.getUser_id())));
	}
	
	@ResponseBody
	@RequestMapping("payByType")
	public JSONObject pay(double money,int type,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.pay(user, 1, money, "手机缴费");
		if (jo.getInteger("error")==200) {
			user.setUser_account_money(user.getUser_account_money()-money);
			req.setAttribute("user", user);
		}
		return jo;
	}
	
	/**
	 * 获得交易类型权重
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getTypeWeight")
	public JSONObject getTypeWeight(HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		return ts.getTypeWeight(Integer.valueOf(user.getUser_id()));
	}
}
