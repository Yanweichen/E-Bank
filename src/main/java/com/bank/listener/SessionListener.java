package com.bank.listener;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.bank.model.user.UserModel;
import com.bank.utils.MySessionContext;
import com.bank.utils.RegularUtil;

public class SessionListener implements HttpSessionListener {

	private MySessionContext myc = MySessionContext.getInstance();  
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		myc.AddSession(arg0.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		HttpSession session = arg0.getSession();
		ServletContext application = session.getServletContext();
		//session销毁移除登陆用户
		RegularUtil.UserLoginMap = (Map<UserModel, String>) application.getAttribute("UserLoginMap");
		if (RegularUtil.UserLoginMap!=null && RegularUtil.UserLoginMap.get((UserModel)session.getAttribute("user"))!=null) {
			RegularUtil.UserLoginMap.remove((UserModel)session.getAttribute("user"));
			application.setAttribute("UserLoginMap", RegularUtil.UserLoginMap);
		}
		//从session表移除session
		myc.DelSession(arg0.getSession()); 
	}

}
