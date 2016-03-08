package com.bank.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.other.Page;
import com.bank.model.user.UserModel;
import com.bank.service.user.UserService;
import com.bank.utils.JsonUtil;
import com.bank.utils.Mail;
import com.bank.utils.MySessionContext;
import com.bank.utils.PortUtil;
import com.bank.utils.QclodImageUtil;
import com.bank.utils.RegularUtil;
import com.google.gson.JsonObject;
import com.qcloud.UploadResult;

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
				jo.put("name", um.getUser_name());
				jo.put("face", um.getUser_face());
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
						jo.put("name", um.getUser_name());
						jo.put("face", um.getUser_face());
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
			jo.put("name", um.getUser_name());
			jo.put("face", um.getUser_face());
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
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("reguser"));
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
		sessionuser.setUser_last_login_time(new Date());
		sessionuser.setUser_regist_time(new Date());
		sessionuser.setUser_account_money(50000);
		send_email_activite(sessionuser);//发送激活邮件
		us.add(sessionuser);
		req.setAttribute("user", sessionuser);
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
	public JSONObject verifyUserIdCard(@RequestParam("user_account")String account,int accountType,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = (UserModel) req.getSession().getAttribute("user");
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
				if (user!=null) {
					if (!user.getUser_email().equals(account)) {
						jo.put("valid",false);
						jo.put("message","该邮箱已注册");
					}
				}else{
					jo.put("valid",false);
					jo.put("message","该邮箱已注册");
				}
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
				if (user!=null) {
					if (!user.getUser_phone().equals(account)) {
						jo.put("valid",false);
						jo.put("message","该号码已注册");
					}
				}else{
					jo.put("valid",false);
					jo.put("message","该号码已注册");
				}
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
		UserModel user = (UserModel) req.getSession().getAttribute("user");
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
	 * 验证账号是否存在
	 * @param account
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("verifyAccountIsNull")
	public JSONObject verifyAccountIsNull(String account,HttpServletRequest req){
		UserModel user = us.findUserByAccoutn(account);
		JSONObject jo = new JSONObject();
		if (user==null) {
			jo.put("valid",false);
			jo.put("message","该账号不存在");
		}else{
			req.getSession().setAttribute("setuser", user);
			jo.put("valid",true);
			jo.put("message","success");
		}
		return jo;
	}
	
	/**
	 * 根据账号发送邮件验证码
	 * @param account
	 * @param req
	 * @return
	 */
	@RequestMapping("sendVcode")
	public JSONObject sendVcode(@RequestParam(value = "account",required = false)String account,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel user = (UserModel) req.getSession().getAttribute("setuser"); 
		if (user==null) {//如果session没有则查询账户
			user = us.findUserByAccoutn(account);
		}
		List<String> email = new ArrayList<String>();
		String user_email = user.getUser_email();
		email.add(user_email);
		String rnum = RandomStringUtils.randomNumeric(5);
		req.getSession().setAttribute("rnum", rnum);
		boolean issuc = new Mail().send("505717760@qq.com",email , null,"e-bank修改密码", "<h1>您好,"+user.getUser_name()+"</h1> "
				+ "您本次的验证码为："+rnum);
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
	 * 验证邮件发送的验证码
	 * @param code
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("verifyEmailCode")
	public JSONObject verifyEmailCode(String code,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		String rnum = (String) req.getSession().getAttribute("rnum");
		if (rnum !=null && rnum.equals(code)) {
			jo.put("valid",true);
			jo.put("message","验证成功");
		}else{
			jo.put("valid",false);
			jo.put("message","验证失败");
		}
		return jo;
	}
	
	/**
	 * 去修改密码的页面
	 * @return
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("goSetPass")
	public void goSetPass(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		UserModel um = (UserModel) req.getSession().getAttribute("setuser");
		resp.setContentType("text/html;charset=utf-8");
		if (um==null) {
			PrintWriter out = resp.getWriter();
			out.print(" <script type='text/javascript'> "
					+ " alert('非法操作'); "
					+ " window.location='User/Login.jsp'; "
					+ " </script> ");
		}else{
			req.getRequestDispatcher("/WEB-INF/setPassword.jsp").forward(req, resp);
		}
	}
	
	/**
	 * 修改密码
	 * @param pass
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("setPass")
	public JSONObject setPass(String pass,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel um = (UserModel) req.getSession().getAttribute("setuser");
		if (um==null) {
			um = (UserModel) req.getSession().getAttribute("user");
		}
		um.setUser_pass(pass);
		int issuc = us.alterById(um);
		if (issuc==1) {
			jo.put("error", "200");
			jo.put("msg", "修改密码成功,请重新登录！");
			req.getSession().removeAttribute("setuser");
			req.getSession().removeAttribute("user");
		}else{
			jo.put("error", "203");
			jo.put("msg", "修改密码失败");
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
	public ModelAndView activateUser(String user_idcard,HttpServletRequest req) {
		//base64解密
		try {
			user_idcard = new String(Base64.decodeBase64(user_idcard),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		if (user_idcard != null && modifyUserState(RegularUtil.NORMAL,user_idcard,req)) {
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
	@ResponseBody
	@RequestMapping("modifyUserState")
	public boolean modifyUserState(int state,String idcard,HttpServletRequest req){
		int issuc = us.alterUserStateByIdCadr(state,idcard);
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		if (issuc==1) {
			user.setUser_state(""+state);
			req.getSession().setAttribute("user", user);//刷新用户信息
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
	
	/**
	 * @param url
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/upLoadFace")
	public JSONObject upLoadFace(String url,HttpServletRequest req) throws Exception{
		JSONObject jo = new JSONObject();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("user") );
		if (sessionuser==null||sessionuser==null) {
			jo.put("error", "403");
			jo.put("msg", "非法操作");
			return jo;
		}
		
		if (Base64.decodeBase64(url).length>=307200) {
			jo.put("error", "303");
			jo.put("msg", "您上传的图片过大("+Base64.decodeBase64(url).length/1024+"KB),请控制在300KB以内");
			return jo;
		}
		UploadResult ret = QclodImageUtil.upload(url);
		if (ret==null) {
			jo.put("error", "203");
			jo.put("msg", "上传失败！");
			return jo;
		}
		sessionuser.setUser_face(ret.downloadUrl);
		us.alterById(sessionuser);
		jo.put("error", "200");
		jo.put("msg", "上传成功！");
		return jo;
	}
	
	/**
	 * 更新用户信息
	 * @param um
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateuserinfo")
	public JSONObject updateUserInfo(UserModel um,HttpServletRequest req){
		JSONObject jo = new JSONObject();
		UserModel sessionuser = ((UserModel)req.getSession().getAttribute("user") );
		sessionuser.setUser_email(um.getUser_email());
		//未激活重新发送邮件或者修改邮箱重新发送邮件
		if ("0".equals(sessionuser.getUser_state()) || !sessionuser.getUser_email().equals(um.getUser_email())) {
			send_email_activite(sessionuser);
		}
		sessionuser.setUser_phone(um.getUser_phone());
		sessionuser.setUser_obligate_info(um.getUser_obligate_info());
		if (us.alterById(sessionuser)==1) {
			jo.put("error", "200");
			jo.put("msg", "修改成功！");
		}else{
			jo.put("error", "203");
			jo.put("msg", "修改失败！");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getusername")
	public JSONObject getUserBalance(String account){
		JSONObject jo = new JSONObject();
		UserModel um = us.findUserByAccoutn(account);
		if (um==null) {
			jo.put("valid", false);
			jo.put("message", "您输入的账号不存在！");
		} else {
			jo.put("valid", true);
			jo.put("message", um.getUser_name().substring(0,1)+"***"+um.getUser_name().substring(um.getUser_name().length()-1,um.getUser_name().length()));
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("getOnLineUser")
	public JSONObject getOnLineUser() throws ParseException, CloneNotSupportedException{
		return JsonUtil.getOnLineUser();
	}
	
	@ResponseBody
	@RequestMapping("getALLUser")
	public JSONObject getALLUser(Page p) throws ParseException{
		return JsonUtil.getAllUser(us.findAllByPage(p),us.findAllCount(p));
	}
}
