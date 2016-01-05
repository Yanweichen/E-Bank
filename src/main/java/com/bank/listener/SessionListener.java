package com.bank.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.bank.utils.MySessionContext;

public class SessionListener implements HttpSessionListener {

	private MySessionContext myc = MySessionContext.getInstance();  
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		myc.AddSession(arg0.getSession());
		System.out.println(myc.mymap);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
//		arg0.getSession().getServletContext().;
		myc.DelSession(arg0.getSession()); 
	}

}
