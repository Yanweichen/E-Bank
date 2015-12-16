package com.bank.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.user.UserModel;
import com.bank.service.user.UserService;
import com.bank.utils.JsonUtil;
import com.bank.utils.PortUtil;
import com.bank.utils.RegularUtil;
import com.google.gson.JsonObject;

@RequestMapping("/user")
@Controller
public class UserInfoController {

	@Autowired
	private UserService us;
	
	/**
	 * 一级注册
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping("/regfirst")
	@ResponseBody
	public JSONObject regist_First(UserModel user,HttpServletRequest req){
		int a = us.addUser_first(user);
		req.getSession().setAttribute("reguser", user);
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
	
	/**
	 * 二级注册
	 * @param user
	 * @param user_code
	 * @param req
	 * @return
	 */
	@RequestMapping("/regsecond")
	@ResponseBody
	public JSONObject regist_Second(UserModel user,@RequestParam("user_code")String user_code,HttpServletRequest req){
		System.out.println(user);
		JSONObject jo = new JSONObject();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("reguser") );
		if (sessionuser==null) {
			jo.put("error", "401");
			jo.put("msg", "访问被拒绝，非法操作");
			return jo;
		}
		//获得useridcard
		user.setUser_idcard(sessionuser.getUser_idcard());
		int issuc = us.addUser_second(user);
		if (issuc!=1) {
			jo.put("error", "202");
			jo.put("msg", "参数有误");
		}else{
			jo.put("error", "200");
			jo.put("msg", "success");
		}
		return jo;
	}
	
	/**
	 * 注册第三步
	 * @param req
	 * @return
	 */
	@RequestMapping("/regthird")
	public ModelAndView regist_third(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("reguser") );
		if (sessionuser==null) {
			
		}
		UserModel user = us.findUserByIdCard(sessionuser.getUser_idcard());
		mv.setViewName("regist/regist_3");
		mv.addObject("user", user);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/removeuser")
	public JSONObject remove_UserByIdcadr(String idcard){
		JSONObject jo = new JSONObject();
		int isSuc = us.removeUserByIdCard(idcard);
		System.out.println(isSuc);
		if (isSuc!=1) {
			jo.put("error", "202");
			jo.put("msg", "参数有误");
		}else{
			jo.put("error", "200");
			jo.put("msg", "删除成功");
		}
		return jo; 
	}
	
	/**
	 * 验证验证码
	 * @param user_code
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/verifyCode")
	public JSONObject verifyCode(String user_code,HttpServletRequest req){
		String rcode =(String)req.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		JSONObject jo = new JSONObject();
		if (rcode.equals(user_code)) {
			jo.put("valid",true);
		}else{
			jo.put("valid",false);
			jo.put("message","验证码错误");
			return jo;
		}
		return jo;
	}
	
	/**
	 * 身份证查重
	 * @param idcard
	 * @return
	 */
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
		if (us.findUserByIdCard(idcard)!=null) {
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
		return jarr;
	}
	@ResponseBody
	@RequestMapping("/getCity")
	public JSONArray getProvince(String code){
		String httpUrl = "http://www.weather.com.cn/data/list3/city"+code+".xml";
		String httpArg = "";
		String jsonResult = PortUtil.request(httpUrl, httpArg);
		JSONArray jarr = JsonUtil.getCorP(jsonResult);
		return jarr;
	}

}
