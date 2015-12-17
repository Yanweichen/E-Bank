package com.bank.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class RegularUtil {

	//邮箱正则表达式
	public static final String  IdCardRegular = "^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
	
	//用户或卡状态
	public static final int nonactivated = 0;//未激活
	public static final int normal = 1;//正常
	public static final int ban = 3;//禁封
	public static final int freeze = 4;//冻结
	public static final int loss = 5;//挂失
	
	public static String getlocathost(){
		String ip = "115.159.66.149";
//		String ip = "localhost";
//		try {
//			 ip = InetAddress.getLocalHost().getHostAddress();
//		} catch (UnknownHostException e) {
//			e.printStackTrace();
//		}
		return ip;
	};
}
