package com.bank.controller.myaccount;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {
	
	@RequestMapping("/mychart")
	public String openMoneyChart(){
		return "myAccont/user_chart";
	}
}
