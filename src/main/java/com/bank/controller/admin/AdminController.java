package com.bank.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	//错误次数
	private int count;
	/**
	 * ModelAttribute标记的方法会在所有其他方法之前调用
	 */
	@ModelAttribute
	public void init(HttpServletRequest req){
		ServletContext application = req.getServletContext();
		application.setAttribute("adminip", RegularUtil.IPMap);
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
		
		if (count==3||hasIp(ip,application)) {
			((HashMap<String,String>)application.getAttribute("adminip")).put(ip, Host);
			jo.put("error", "203");
			jo.put("msg", "您的ip已锁定,请联系管理员");
			return jo;
		}
		if (am==null) {
			jo.put("error", "203");
			jo.put("msg", "账号不存在");
			count++;
		}else{
			if (am.getAdmin_password().equals(pass)) {
				req.getSession().setAttribute("admin", am);
				jo.put("error", "200");
				jo.put("msg", "登陆成功");
				count=0;
			}else{
				jo.put("error", "203");
				jo.put("msg", "密码错误");
				count++;
			}
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
	
}
