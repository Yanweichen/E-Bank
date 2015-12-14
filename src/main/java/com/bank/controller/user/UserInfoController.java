package com.bank.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.user.UserModel;
import com.bank.service.user.UserService;
import com.bank.utils.RegularUtil;

@RequestMapping("/user")
@Controller
public class UserInfoController {

	@Autowired
	private UserService us;
	
	@RequestMapping("/regfirst")
	@ResponseBody
	public JSONObject regist_First(UserModel user){
//		int a = us.addUser_first(user);
		int a = 1;
		JSONObject jo = new JSONObject();
		if (a!=1) {
			jo.put("error", "202");
			jo.put("msg", "参数有误");
		}else{
			jo.put("error", "200");
			jo.put("msg", "success");
		}
		return jo;
	}
	
	@RequestMapping("/verifyIdCard")
	@ResponseBody
	public JSONObject verifyUserIdCard(@RequestParam("user_idcard")String idcard){
		JSONObject jo = new JSONObject();
		if (idcard.matches(RegularUtil.IdCardRegular)) {
		} else {
			jo.put("valid", false);
			jo.put("message", "非法的身份证号");
			return jo;
		}
		if (us.verifyIdCard(idcard)!=null) {
			jo.put("valid",false);
			jo.put("message","该身份证已注册");
		}else{
			jo.put("valid", true);
		}
		return jo;
	}
}
