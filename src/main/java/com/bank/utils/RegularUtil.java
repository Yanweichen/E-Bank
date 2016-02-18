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
	//记录的ip表
	public static Map<String,String> IPMap = new HashMap<String,String>();
	//ip登陆次数
	public static Map<String,Integer> LoginCountMap = new HashMap<String,Integer>();
	
	//用户或卡状态
	/**
	 * 未激活
	 */
	public static final int NONACTIVATED = 0;//未激活
	/**
	 * 正常
	 */
	public static final int NORMAL = 1;//正常
	/**
	 * 禁封
	 */
	public static final int BAN = 2;//禁封
	/**
	 * 冻结
	 */
	public static final int FREEZE = 3;//冻结
	/**
	 * 挂失
	 */
	public static final int LOSS = 4;//挂失
	/**
	 * 审核
	 */
	public static final int CHECK = 5;//审核
	
	public static final int STICK = 1;//挂失
	public static final int STAR = 5;//挂失
	
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
