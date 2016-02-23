package com.bank.controller.trade;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
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
	
	@ResponseBody
	@RequestMapping("/tradeEbaoByaccount")
	public JSONObject tradeEbao(String touser,String tradeinfo,double trademoney,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.trade(user, touser, tradeinfo, trademoney);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
	}
	@ResponseBody
	@RequestMapping("/tradeByCard")
	public JSONObject tradeByCard(String touser,String cardnum,String tradeinfo,double trademoney,HttpServletRequest req){
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		JSONObject jo = ts.trade(user, cardnum, touser, tradeinfo, trademoney);
		if (jo.getInteger("error")==200) {
			req.getSession().setAttribute("user", us.findUserByAccoutn(user.getUser_idcard()));//刷新用户信息
		}
		return jo;
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
}
