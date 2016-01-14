package com.bank.utils;

import java.util.HashMap;
import java.util.Map;

import com.bank.model.user.UserModel;

public class RegularUtil {

	//身份证正则表达式
	public static final String  IdCardRegular = "^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
	//邮箱正则
	public static final String  EmailRegular = "^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
	//手机正则
	public static final String  PhoneRegular = "^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
	
	//用户登录map
	public static Map<UserModel,String> UserLoginMap = new HashMap<UserModel,String>();
	//Ipmap
	public static Map<String,String> IPMap = new HashMap<String,String>();
	
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
