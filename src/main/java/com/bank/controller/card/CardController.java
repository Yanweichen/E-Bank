package com.bank.controller.card;

import java.text.ParseException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bank.annotation.SystemControllerBeforeLog;
import com.bank.model.card.CardCheckModel;
import com.bank.model.card.UserCardModel;
import com.bank.model.msg.MsgModel;
import com.bank.model.other.Page;
import com.bank.model.user.UserModel;
import com.bank.service.card.CardCheckService;
import com.bank.service.card.CardService;
import com.bank.service.card.UserCardService;
import com.bank.service.msg.MsgService;
import com.bank.service.user.UserService;
import com.bank.utils.JsonUtil;
import com.bank.utils.RegularUtil;

@Controller
@RequestMapping("/card")
public class CardController {

	@Autowired
	private CardService cs;//卡片本身的操作
	@Autowired
	private CardCheckService ccs;//审核办卡的操作
	@Autowired
	private UserCardService ucs;//用户所属卡的操作
	@Autowired
	private MsgService ms;//消息操作
	@Autowired
	private UserService us;
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
	@SystemControllerBeforeLog(description = "用户申请银行卡")
	@RequestMapping("/opencardcheck")
	public String goCheck(CardCheckModel ccm){
		UserCardModel ucm = new UserCardModel();
		ucm.setUserCardBalance(50000.0000);//默认余额5W
		ucm.setUserCardState(RegularUtil.CHECK);//设置卡的状态为审核中
		ucm.setUserCardType(ccm.getCardCheckCardtype());
		ucm.setUserCardUserId(ccm.getCardCheckUser());
		ucm.setUser_card_opentime(new Date());
		ucm.setUserCardNum(UUID.randomUUID().toString());
		ucs.add(ucm);//插入新卡
		ccm.setCardCheckOpencardId(ucm.getUserCardId());//获取新卡id
		ccs.add(ccm);//插入待审核列表
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
	@SystemControllerBeforeLog(description = "用户申请银行卡成功")
	@ResponseBody
	@RequestMapping("/opencard")
	public JSONObject opencard(int user_id,int card_id){
		JSONObject jo = new JSONObject();
		int suc = ucs.alertCardStateById(card_id,RegularUtil.NORMAL);//修改卡片为正常状态
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
				suc = ccs.RemoveById(card_id);
				if (suc==1) {
					jo.put("error", "200");
					jo.put("msg", "办卡成功");
				} else {
					jo.put("error", "203");
					jo.put("msg", "删除审核失败！");
				}
				
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
	
	/**
	 * 拒绝办卡 审核不通过
	 * @param user_id
	 * @param card_id
	 * @param title
	 * @param content
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/rejectOpenCard")
	public JSONObject rejectOpenCard(int user_id,int card_id,String title,String content){
		return ucs.rejectOpenCard(user_id, card_id, title, content);
	}
	
	/**
	 * 获得卡列表
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/userCardListJSON")
	public JSONObject userCardListJSON(HttpServletRequest req){
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		return JsonUtil.getUserCardList(ucs.findAllByUser(Integer.valueOf(user.getUser_id())));
	}
	
	@ResponseBody
	@RequestMapping("/ishavecard")
	public JSONObject isHaveCard(String cardnum){
		JSONObject jo = new JSONObject();
		UserCardModel ucm = ucs.findCardByCardNum(cardnum);
		if (ucm==null) {
			jo.put("valid",false);
			jo.put("message","该卡不存在");
		}else{
			UserModel um = us.findUserByCardNum(cardnum);
			jo.put("valid",true);
			jo.put("message", um.getUser_name().substring(0,1)+"***"+um.getUser_name().substring(um.getUser_name().length()-1,um.getUser_name().length()-0));
		}
		return jo;
	}
	
	/**
	 * 查卡数量
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getcardcount")
	public JSONObject selectCardCountByUser(HttpServletRequest req){
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		int id = Integer.valueOf(user.getUser_id());
		JSONObject jo = new JSONObject();
		jo.put("error", 200);
		jo.put("msg", ucs.selectCardCountByUser(id));
		return jo;
	}
}
