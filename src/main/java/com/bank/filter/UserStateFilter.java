package com.bank.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.user.UserModel;

public class UserStateFilter extends HandlerInterceptorAdapter {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		UserModel um = (UserModel) request.getSession().getAttribute("user");
		switch (um.getUser_state()) {
		case "1":
			break;
		case "2":
			responseMsg(response,"您的账户已被禁封！请联系管理员");
			 return false; 
		case "0":
			responseMsg(response,"您的账户未激活,请先激活！");
			 return false; 
		default:
			break;
		}
		return true;
	}

	private void responseMsg(HttpServletResponse response,String msg) throws IOException {
		response.setContentType("text/html");  
		 response.setCharacterEncoding("utf-8");  
		 PrintWriter out = response.getWriter();
		 JSONObject jo = new JSONObject();
		 jo.put("error", 203);
		 jo.put("msg", msg);
		 out.print(jo.toString());    
		 out.close();
	}
}
