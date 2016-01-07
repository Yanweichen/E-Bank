package com.bank.controller.myaccount;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/myaccount")
public class MyAccountController {
	
	@RequestMapping("/mychart")
	public String openMoneyChart(){
		return null;
	}
}
