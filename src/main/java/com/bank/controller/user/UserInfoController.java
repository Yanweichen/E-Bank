package com.bank.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.user.UserModel;
import com.bank.service.user.UserService;
import com.bank.utils.JsonUtil;
import com.bank.utils.PortUtil;
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
	
	@RequestMapping("/regfirst")
	@ResponseBody
	public JSONObject regist_Second(UserModel user,HttpServletRequest req){
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
		String rcode =(String)req.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
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
	
	@ResponseBody
	@RequestMapping("/getProvince")
	public JSONArray getProvince(){
		String httpUrl = "http://www.weather.com.cn/data/list3/city.xml";
		String httpArg = "";
		String jsonResult = PortUtil.request(httpUrl, httpArg);
		JSONArray jarr = JsonUtil.getCorP(jsonResult);
		System.out.println(jarr);
		return jarr;
	}
	@ResponseBody
	@RequestMapping("/getCity")
	public JSONArray getProvince(String code){
		String httpUrl = "http://www.weather.com.cn/data/list3/city"+code+".xml";
		String httpArg = "";
		String jsonResult = PortUtil.request(httpUrl, httpArg);
		JSONArray jarr = JsonUtil.getCorP(jsonResult);
		System.out.println(jarr);
		return jarr;
	}

}
