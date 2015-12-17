package com.bank.controller.user;

import java.util.ArrayList;
import java.util.List;

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
import com.bank.utils.Mail;
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
//		int a = us.addUser_first(user);
		JSONObject jo = new JSONObject();
		if (user==null) {
			jo.put("error", "202");
			jo.put("msg", "参数有误");
		}else{
			req.getSession().setAttribute("reguser", user);
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
		JSONObject jo = new JSONObject();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("reguser") );
		if (sessionuser==null) {
			jo.put("error", "401");
			jo.put("msg", "访问被拒绝，非法操作");
			return jo;
		}
		user.setUser_name(sessionuser.getUser_name());
		user.setUser_idcard(sessionuser.getUser_idcard());
		user.setUser_phone(sessionuser.getUser_phone());
		req.getSession().setAttribute("reguser", user);
		jo.put("error", "200");
		jo.put("msg", "success");
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
		UserModel user = us.findUserByIdCard(sessionuser.getUser_idcard());
		mv.setViewName("regist/regist_3");
		mv.addObject("user", user);
		return mv;
	}

	/**
	 * 添加用户
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/adduser")
	public JSONObject addUser(HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("reguser") );
		if (sessionuser==null) {
			jo.put("error", "401");
			jo.put("msg", "访问被拒绝，非法操作");
			return jo;
		}
		send_email_activite(sessionuser);//发送激活邮件
		us.add(sessionuser);
		jo.put("error", "200");
		jo.put("msg", "success");
		return jo;
	}
	
	/**
	 * 根据身份证删除用户
	 * @param idcard
	 * @return
	 */
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

	@ResponseBody
	@RequestMapping("/sendMail_Reg_Again")
	public JSONObject sendMail_Reg_Again(HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = (UserModel) req.getSession().getAttribute("reguser");
		if (user==null) {
			jo.put("error", "203");
			jo.put("msg", "非法操作！");
			return jo;
		}
		boolean issuc = send_email_activite(user);//发送激活邮件
		if (issuc) {
			jo.put("error", "200");
			jo.put("msg", "发送成功！");
		}else{
			jo.put("error", "203");
			jo.put("msg", "发送失败！");
		}
		return jo;
	}

	/**
	 * 发送激活邮件
	 * @param user
	 * @return
	 */
	private boolean send_email_activite(UserModel user) {
		List<String> email = new ArrayList<String>();
		String user_email = user.getUser_email();
		email.add(user_email);
		String user_idcard = user.getUser_idcard();
		String user_name = user.getUser_name();
		boolean issuc = new Mail().send("505717760@qq.com",email , null,"e-bank账号激活", "<h1>您好,"+user_name+"</h1> "
				+ "<a href=\"http://"+RegularUtil.getlocathost()+"/user/activateUser.action?user_idcard="+user_idcard+"\">请您点击这里激活您的账号</a>");
		return issuc;
	}
	
	@RequestMapping("/activateUser")
	public ModelAndView activateUser(String user_idcard) {
		ModelAndView mv = new ModelAndView();
		if (user_idcard != null && modifyUserState(RegularUtil.normal,user_idcard)) {
			mv.addObject("isactivate", "激活成功！");
		} else {
			mv.addObject("isactivate", "激活失败！");
		}
		mv.setViewName("regist/reg_activate_suc");
		return mv;
	}
	
	/**
	 * 修改用户状态
	 * @param idcard
	 * @param state
	 * @return
	 */
	public boolean modifyUserState(int state,String idcard){
		int issuc = us.alterUserStateByIdCadr(state,idcard);
		if (issuc==1) {
			return true;
		}else{
			return false;
		}
	}
}
