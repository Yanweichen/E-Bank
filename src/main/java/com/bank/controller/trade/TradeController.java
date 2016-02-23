package com.bank.controller.trade;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.user.UserModel;
import com.bank.service.trade.TradeService;

@Controller
@RequestMapping("/trade")
public class TradeController {

	@Autowired
	private TradeService ts;
	
	@ResponseBody
	@RequestMapping("/tradeEbaoByaccount")
	public JSONObject tradeEbao(String touser,String tradeinfo,double trademoney,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		if (ts.trade(user, touser, tradeinfo, trademoney)) {
			jo.put("error", 200);
			jo.put("msg", "转账成功！");
		} else {
			jo.put("error", 203);
			jo.put("msg", "转账失败！");
		}
		return jo;
	}
	@ResponseBody
	@RequestMapping("/tradeByCard")
	public JSONObject tradeByCard(String touser,String cardnum,String tradeinfo,double trademoney,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = ((UserModel)req.getSession().getAttribute("user") );
		if (ts.trade(user,cardnum, touser, tradeinfo, trademoney)) {
			jo.put("error", 200);
			jo.put("msg", "转账成功！");
		} else {
			jo.put("error", 203);
			jo.put("msg", "转账失败！");
		}
		return jo;
	}
	
}
