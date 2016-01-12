package com.bank.controller.index;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.service.index.IndexService;
import com.bank.utils.JsonUtil;
import com.bank.utils.RegularUtil;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService is;
	
	@ResponseBody
	@RequestMapping("/notice")
	public JSONArray getNotice(@RequestParam("num")Integer num,HttpServletRequest req){
//		HttpSession session = req.getSession(true);
//		String user_sessionid = null;
//		if (req.getCookies()!=null) {
//			for (Cookie cookie: req.getCookies()) {
//				if ("JSESSIONID".equals(cookie.getName())) {
//					user_sessionid = cookie.getValue();
//				}
//			}
//		}
//		String server_sessionid = session.getId();
//		System.out.println("user_sessionid:"+user_sessionid);
//		System.out.println("server_sessionid:"+server_sessionid);
//		if (server_sessionid.equals(user_sessionid)) {
			return JsonUtil.getNotice(is.findeByNum(num));
//		}else{
//			System.out.println("拒绝登陆"+req.getSession());
//			JSONArray jar = new JSONArray();
//			JSONObject jo = new JSONObject();
//			jo.put("304", "拒绝登陆");
//			jar.add(jo);
//			return jar;
//		}
	}
	
	@RequestMapping("/session")
	public String getTestSession(HttpServletRequest req){
		req.getSession().invalidate();
		return "index";
	}
	
	@RequestMapping("/myBank")
	public String gotoMyBank(){
		return "bus_index";
	}
	@RequestMapping("/index")
	public String gotoIndex(){
		return "index";
	}
}
