package com.bank.filter;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bank.model.user.UserModel;

public class SessionFilter extends HandlerInterceptorAdapter {

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
		if (um==null) {
			 response.setContentType("text/html");  
             response.setCharacterEncoding("utf-8");  
             PrintWriter out = response.getWriter();    
             StringBuilder builder = new StringBuilder();    
             builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");    
             builder.append("alert(\"您的账号已退出或在别处登陆！请重新登录！\");");    
             builder.append("window.location.href=\"/page/index.jsp\";");    
             builder.append("</script>");    
             out.print(builder.toString());    
             out.close();    
             return false;  
		}else{
			return true;
		}
	}

}
