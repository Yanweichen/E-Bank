package com.bank.controller.myaccount;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myAccount")
public class MyAccountController {
	
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
}
