package com.bank.controller.admin;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.admin.AdminModel;
import com.bank.service.admin.AdminService;
import com.bank.utils.RegularUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService as;
	private int[] numArray= {3,2,1};
	
	/**
	 * ModelAttribute标记的方法会在所有其他方法之前调用
	 */
	@InitBinder
	public void init(HttpServletRequest req){
		ServletContext application = req.getServletContext();
	
	}
	
	/**
	 * 查看是ip否被记录
	 * @param ip
	 * @param application
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private boolean hasIp(String ip,ServletContext application){
		for (String mapip : ((HashMap<String,String>)application.getAttribute("adminip")).keySet()) {
			if (mapip.equals(ip)) {
				return true;
			}
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/login")
	public JSONObject adminLogin(@RequestParam("adminname")String name,@RequestParam("adminpass")String pass,HttpServletRequest req){
		AdminModel am = as.findAdminByName(name);
		JSONObject jo = new JSONObject();
		ServletContext application = req.getSession().getServletContext();
		String ip = req.getRemoteAddr();
		String Host = req.getRemoteHost();
		HashMap<String,Integer> loginCount = ((HashMap<String,Integer>)application.getAttribute("LoginCount"));
		//首次程序首次运行
		if (loginCount==null) {
			application.setAttribute("adminip", RegularUtil.IPMap);
			application.setAttribute("LoginCount", RegularUtil.LoginCountMap);
			loginCount = ((HashMap<String,Integer>)application.getAttribute("LoginCount"));
		}
		//ip首次
		if (loginCount.get(ip)==null) {
			RegularUtil.LoginCountMap.put(ip, 0);
			application.setAttribute("LoginCount", RegularUtil.LoginCountMap);
			loginCount = ((HashMap<String,Integer>)application.getAttribute("LoginCount"));
		}
		//获取登录次数
		int count = loginCount.get(ip);
		if (count>=3||hasIp(ip,application)) {
			//最后一次登陆判断是否正确
			if (count==3 && am!=null && am.getAdmin_password().equals(pass)) {
				req.getSession().setAttribute("admin", am);
				jo.put("error", "200");
				jo.put("msg", "登陆成功");
				count=0;
				RegularUtil.LoginCountMap.put(ip, count);
				application.setAttribute("LoginCount", RegularUtil.LoginCountMap);
				return jo;
			}
			((HashMap<String,String>)application.getAttribute("adminip")).put(ip, Host);
			jo.put("error", "203");
			jo.put("msg", "您的ip已锁定,请联系管理员");
			//记录登录次数
			loginCount.put(ip, ++count);
			return jo;
		}
		if (am==null) {
			jo.put("error", "203");
			jo.put("msg", "账号不存在,您还可以尝试"+numArray[count]+"次");
		}else{
			if (am.getAdmin_password().equals(pass)) {
				req.getSession().setAttribute("admin", am);
				jo.put("error", "200");
				jo.put("msg", "登陆成功");
				count=0;
				RegularUtil.LoginCountMap.put(ip, count);
				application.setAttribute("LoginCount", RegularUtil.LoginCountMap);
				return jo;
			}else{
				jo.put("error", "203");
				jo.put("msg", "密码错误,您还可以尝试"+numArray[count]+"次");
			}
		}
		//记录登录次数
		loginCount.put(ip, ++count);
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
		AdminModel am = (AdminModel) req.getSession().getAttribute("admin");
		if (am!=null) {
			req.getSession().removeAttribute("admin");
			jo.put("error", "200");
			jo.put("msg", "退出成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "退出失败");
		}
		return jo;
	}
	
	/**
	 * 前往首页
	 * @return
	 */
	@RequestMapping("/adminIndex")
	public String goAdminIndex(HttpServletRequest req){
		if (req.getSession().getAttribute("admin")==null) {
			return "";//非法操作界面
		}
		return "admin/e-bank_admin_index";
	}
	/**
	 * 前往更新首页页面
	 * @param req
	 * @return
	 */
	@RequestMapping("/updateIndex")
	public String UpdateIndex(HttpServletRequest req){
		if (req.getSession().getAttribute("admin")==null) {
			return "";//非法操作界面
		}
		return "admin/indexManage/indexManage";
	}
	/**
	 * 前往更新首页页面
	 * @param req
	 * @return
	 */
	@RequestMapping("/AddIndex")
	public String AddIndex(HttpServletRequest req){
		if (req.getSession().getAttribute("admin")==null) {
			return "";//非法操作界面
		}
		return "admin/indexManage/addArticle";
	}
	
	/**
	 * 前往更新文章页面
	 * @param req
	 * @return
	 */
	@RequestMapping("/UpdateArticle")
	public String updateArticle(HttpServletRequest req){
		if (req.getSession().getAttribute("admin")==null) {
			return "";//非法操作界面
		}
		return "admin/indexManage/updateArticle";
	}
}
