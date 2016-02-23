package com.bank.controller.myaccount;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bank.model.user.UserModel;
import com.bank.service.card.CardService;
import com.bank.service.card.UserCardService;

@Controller
@RequestMapping("/myAccount")
public class MyAccountController {
	
	@Autowired
	private CardService cs;
	@Autowired
	private UserCardService ucs;
	
	@RequestMapping("/mychart")
	public String openMoneyChart(){
		return "myAccount/user_chart";
	}
	
	@RequestMapping("/mybank")
	public String openMyBank(){
		return "myAccount/user_index";
	}
	
	@RequestMapping("/accountSet")
	public String accountSet(){
		return "myAccount/accountManage/accountset";
	}
	
	@RequestMapping("/faceSet")
	public String faceSet(){
		return "myAccount/accountManage/faceset";
	}
	
	@RequestMapping("/viewCard")
	public ModelAndView viewCard(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myAccount/cardManage/viewcard");
		mv.addObject("cardlist",cs.findAll());
		return mv;
	}
	
	@RequestMapping("/userCardList")
	public ModelAndView userCardList(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myAccount/cardManage/usercardlist");
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		mv.addObject("usercardlist",ucs.findAllByUser(Integer.valueOf(user.getUser_id())));
		return mv;
	}
	
	
	@RequestMapping("/trade")
	public String trade(){
		return "myAccount/tradeManage/trade";
	}
}
