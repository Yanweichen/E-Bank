package com.bank.controller.user;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.bank.utils.MySessionContext;
import com.bank.utils.PortUtil;
import com.bank.utils.RegularUtil;
import com.google.gson.JsonObject;

/**
 * @author yanwe
 * error 200 成功 
 * error 202 参数有误
 * error 203 操作失败
 * error 401 非法操作 
 * 
 */
@RequestMapping("user")
@Controller
public class UserInfoController {

	@Autowired
	private UserService us;
	
	/**
	 * 登陆
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/login")
	public JSONObject login(@RequestParam("user_account")String account,@RequestParam("user_password")String pass,HttpServletRequest req){
		UserModel um = us.findUserByAccoutn(account);
		JSONObject jo = new JSONObject();
		if (um==null) {
			jo.put("error", "203");
			jo.put("msg", "该用户不存在");
			return jo;
		}
		
		//验证密码
		if (um.getUser_pass().equals(pass)) {
			ServletContext application = req.getServletContext();
			HttpSession nowUser = req.getSession();
			String sessionid = nowUser.getId();
			//首次登陆
			if (application.getAttribute("UserLoginMap")==null) {
				RegularUtil.UserLoginMap = new HashMap<UserModel, String>();
				RegularUtil.UserLoginMap.put(um, sessionid);
				application.setAttribute("UserLoginMap", RegularUtil.UserLoginMap);
				nowUser.setAttribute("user", um);
				jo.put("error", "200");
				jo.put("msg", um.getUser_name());
				return jo;
			}
			//查询是否存在登陆
			RegularUtil.UserLoginMap = (Map<UserModel, String>) application.getAttribute("UserLoginMap");
			for (Map.Entry<UserModel, String> entry : RegularUtil.UserLoginMap.entrySet()) {
				if (um.getUser_id().equals(entry.getKey().getUser_id())) {
					if(!entry.getValue().equals(sessionid)){
						//不同session登陆强制下线
						MySessionContext myc= MySessionContext.getInstance();
						HttpSession olduser = myc.getSession(entry.getValue()); 
						olduser.removeAttribute("user");
						RegularUtil.UserLoginMap.remove(entry.getKey());
						RegularUtil.UserLoginMap.put(um, sessionid);
						application.setAttribute("UserLoginMap", RegularUtil.UserLoginMap);
						nowUser.setAttribute("user", um);
						jo.put("error", "200");
						jo.put("msg", um.getUser_name());
						return jo;
					}
					//已登陆(同一浏览器同时登陆)
					jo.put("error", "203");
					jo.put("msg", "该用户已登陆");
					return jo;
				}
			}
			//登陆表中未查询到则存入登陆表
			RegularUtil.UserLoginMap.put(um, sessionid);
			application.setAttribute("UserLoginMap", RegularUtil.UserLoginMap);
			nowUser.setAttribute("user", um);
			jo.put("error", "200");
			jo.put("msg", um.getUser_name());
		}else{
			jo.put("error", "203");
			jo.put("msg", "密码错误");
		}
		return jo;
	}
	
	/**
	 * 用户退出
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public JSONObject Logout(HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		if (user!=null) {
			req.getSession().removeAttribute("user");
			RegularUtil.UserLoginMap.remove(user);
			jo.put("error", "200");
			jo.put("msg", "退出成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "退出失败");
		}
		return jo;
	}
	
	/**
	 * 一级注册
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping("/regfirst")
	@ResponseBody
	public JSONObject regist_First(UserModel user,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		if (user==null) {
			jo.put("error", "202");
			jo.put("msg", "参数有误");
		}else{
			req.getSession().setAttribute("user", user);
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
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("user"));
		if (sessionuser==null) {
			jo.put("error", "401");
			jo.put("msg", "访问被拒绝，非法操作");
			return jo;
		}
		user.setUser_name(sessionuser.getUser_name());
		user.setUser_idcard(sessionuser.getUser_idcard());
		user.setUser_phone(sessionuser.getUser_phone());
		req.getSession().setAttribute("user", user);
		jo.put("error", "200");
		jo.put("msg", "success");
		return jo;
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
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("user") );
		if (sessionuser==null) {
			jo.put("error", "401");
			jo.put("msg", "访问被拒绝，非法操作");
			return jo;
		}
		sessionuser.setUser_last_login_time(new Date());
		sessionuser.setUser_regist_time(new Date());
		send_email_activite(sessionuser);//发送激活邮件
		us.add(sessionuser);
		jo.put("error", "200");
		jo.put("msg", "success");
		return jo;
	}
	
	/**
	 * 根据账户删除用户
	 * @param idcard
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/removeuser")
	public JSONObject remove_UserByIdcadr(String account){
		JSONObject jo = new JSONObject();
		int isSuc = us.removeUserByAccount(account);
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
	 * @param account 查重的账号(身份证,邮箱,手机号)
	 * @param accountType 需要查重的类型 0 身份证 1 邮箱 2 手机
	 * @return
	 */
	@RequestMapping("/verifyAccount")
	@ResponseBody
	public JSONObject verifyUserIdCard(@RequestParam("user_account")String account,int accountType){
		JSONObject jo = new JSONObject();
		switch (accountType) {
		case 0:
			if (account.matches(RegularUtil.IdCardRegular)) {
			} else {
				jo.put("valid", false);
				jo.put("message", "非法的身份证号");
				return jo;
			}
			if (us.findUserByAccoutn(account)!=null) {
				jo.put("valid",false);
				jo.put("message","该身份证已注册");
			}else{
				jo.put("valid", true);
			}
			break;
		case 1:
			if (account.matches(RegularUtil.EmailRegular)) {
			} else {
				jo.put("valid", false);
				jo.put("message", "邮箱格式不正确");
				return jo;
			}
			if (us.findUserByAccoutn(account)!=null) {
				jo.put("valid",false);
				jo.put("message","该邮箱已注册");
			}else{
				jo.put("valid", true);
			}
			break;
		case 2:
			if (account.matches(RegularUtil.PhoneRegular)) {
			} else {
				jo.put("valid", false);
				jo.put("message", "手机号码格式不正确");
				return jo;
			}
			if (us.findUserByAccoutn(account)!=null) {
				jo.put("valid",false);
				jo.put("message","该号码已注册");
			}else{
				jo.put("valid", true);
			}
			break;
		default:
			break;
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
			jo.put("error", "401");
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
		//base64加密
		user_idcard = Base64.encodeBase64URLSafeString(user_idcard.getBytes());
		String user_name = user.getUser_name();
		boolean issuc = new Mail().send("505717760@qq.com",email , null,"e-bank账号激活", "<h1>您好,"+user_name+"</h1> "
				+ "<a href=\"http://"+RegularUtil.getlocathost()+"/user/activateUser.action?user_idcard="+user_idcard+"\">请您点击这里激活您的账号</a>");
		return issuc;
	}
	
	@RequestMapping("/activateUser")
	public ModelAndView activateUser(String user_idcard) {
		//base64解密
		try {
			user_idcard = new String(Base64.decodeBase64(user_idcard),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		if (user_idcard != null && modifyUserState(RegularUtil.normal,user_idcard)) {
			mv.addObject("isactivate", "激活成功！");
		} else {
			mv.addObject("isactivate", "激活失败！");
		}
		mv.setViewName("reg_activate_suc");
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
	
	/**
	 * 注册成功
	 * @return
	 */
	@RequestMapping("/regsuc")
	public String UserRegSuc(){
		return "regist_success";
	}
	
}
