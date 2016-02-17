package com.bank.controller.card;

import java.text.ParseException;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.UUIDCodec;
import com.bank.model.card.CardCheckModel;
import com.bank.model.card.UserCardModel;
import com.bank.model.other.Page;
import com.bank.service.card.CardCheckService;
import com.bank.service.card.CardService;
import com.bank.service.card.UserCardService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("/card")
public class CardController {

	@Autowired
	private CardService cs;
	@Autowired
	private CardCheckService ccs;
	@Autowired
	private UserCardService ucc;
	/**
	 * 根据id获取卡片类型
	 * @param id
	 * @return
	 */
	@RequestMapping("/getcardtype")
	public ModelAndView getOneCardType(int id){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myAccount/cardManage/opencard");
		mv.addObject("cardtype",cs.findById(id));
		return mv;
	}
	
	@RequestMapping("/opencardcheck")
	public String goCheck(CardCheckModel ccm){
		ccs.add(ccm);
		return "myAccount/cardManage/opencardchecking";
	}
	
	@RequestMapping("/checkcard")
	public String goCheckCardList(){
		return "admin/checkManage/checkcard";
	}
	
	@ResponseBody
	@RequestMapping("/getCheckCardList")
	public JSONObject getCheckCardList(Page p) throws ParseException{
		return JsonUtil.getCardCheckList(ccs.findCheckUserAndCardAll(p), ccs.findCheckUserAndCardNum());
	}
	
	/**
	 * 办卡
	 * @param user_id
	 * @param card_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/opencard")
	public JSONObject opencard(int user_id,int card_id){
		JSONObject jo = new JSONObject();
		UserCardModel ucm = new UserCardModel();
		ucm.setUserCardBalance(50000.0000);//默认余额5W
		ucm.setUserCardState(1);//设置卡的状态为正常
		ucm.setUserCardType(card_id);
		ucm.setUserCardUserId(user_id);
		ucm.setUser_card_opentime(new Date());
		ucm.setUserCardNum(UUID.randomUUID().toString());
		int suc = ucc.add(ucm);
		if (suc==1) {
			jo.put("error", "200");
			jo.put("msg", "办卡成功");
		}
		return jo;
	}
}
