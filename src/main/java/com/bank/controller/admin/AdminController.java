package com.bank.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.admin.AdminModel;
import com.bank.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService as;
	
	@RequestMapping("/login")
	public JSONObject adminLogin(String name,String pass,HttpServletRequest req){
		AdminModel am = as.findAdminByName(name);
		JSONObject jo = new JSONObject();
		if (am==null) {
			jo.put("error", "203");
			jo.put("msg", "账号不存在");
		}else{
			if (am.getAdmin_password().equals(pass)) {
				req.getSession().setAttribute("admin", am);
				jo.put("error", "200");
				jo.put("msg", "登陆成功");
			}else{
				jo.put("error", "203");
				jo.put("msg", "密码错误");
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
