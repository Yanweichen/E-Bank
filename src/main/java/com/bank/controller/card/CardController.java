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
import com.bank.model.card.CardCheckModel;
import com.bank.model.card.UserCardModel;
import com.bank.model.msg.MsgModel;
import com.bank.model.other.Page;
import com.bank.service.card.CardCheckService;
import com.bank.service.card.CardService;
import com.bank.service.card.UserCardService;
import com.bank.service.msg.MsgService;
import com.bank.utils.JsonUtil;
import com.bank.utils.RegularUtil;

@Controller
@RequestMapping("/card")
public class CardController {

	@Autowired
	private CardService cs;
	@Autowired
	private CardCheckService ccs;
	@Autowired
	private UserCardService ucc;
	@Autowired
	private MsgService ms;
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
		UserCardModel ucm = new UserCardModel();
		ucm.setUserCardBalance(50000.0000);//默认余额5W
		ucm.setUserCardState(RegularUtil.CHECK);//设置卡的状态为审核中
		ucm.setUserCardType(ccm.getCardCheckCardtype());
		ucm.setUserCardUserId(ccm.getCardCheckUser());
		ucm.setUser_card_opentime(new Date());
		ucm.setUserCardNum(UUID.randomUUID().toString());
		ucc.add(ucm);
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
		int suc = ucc.alertCardStateById(card_id,RegularUtil.NORMAL);//修改卡片为正常状态
		if (suc==1) {
			MsgModel mm = new MsgModel();
			mm.setMsgState(false);//未阅读消息
			mm.setMsgTitle("银行卡申请成功!");
			mm.setMsgContent("您的银行卡申请成功,请携带相关证件到附近营业厅办理相关手续！");
			mm.setMsgType(3);//1 公告 2 活动 3 通知
			mm.setMsgUserId(user_id);
			mm.setMsgTime(new Date());
			suc = ms.add(mm);
			if (suc==1) {
				jo.put("error", "200");
				jo.put("msg", "办卡成功");
			}else{
				jo.put("error", "203");
				jo.put("msg", "信息发送失败");
			}
		}else{
			jo.put("error", "203");
			jo.put("msg", "办卡失败");
		}
		return jo;
	}
}