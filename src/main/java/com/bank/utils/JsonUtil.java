package com.bank.utils;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mbeans.UserMBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.card.CheckUserAndCardModel;
import com.bank.model.card.UserCardListModel;
import com.bank.model.index.CommentModel;
import com.bank.model.index.IndexModel;
import com.bank.model.index.LabelModel;
import com.bank.model.msg.MsgModel;
import com.bank.model.trade.TradeModel;
import com.bank.model.user.UserModel;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {

	private static Gson gson=null;
    static{
        if(gson==null){
            gson=new GsonBuilder().disableHtmlEscaping().create();;
        }
    }
	
    /**
	 * 获得多条公告
	 * @param ilist
	 * @return
	 * @throws ParseException 
	 */
	public static JSONObject getSingleNotice(IndexModel im,String format) throws ParseException{
		im.setIndex_uptime_format(TimeUtil.Date2String(im.getIndex_uptime(), format));
		return (JSONObject) JSON.toJSON(im);
	}
	
	/**
	 * @param ilist 全部数据
	 * @param top 置顶
	 * @param total 总数
	 * @param format 日期格式
	 * @return
	 * @throws ParseException
	 */
	public static JSONObject getNotice(List<IndexModel> ilist,IndexModel top,int total,String format) throws ParseException{
		JSONObject jarr =  new JSONObject();
		jarr.put("total", total);
		if (top!=null) {
			jarr.put("top", getSingleNotice(top,format));
		}else{
			jarr.put("top", null);
		}
		JSONArray row =  new JSONArray();
		for (IndexModel im : ilist) {
			im.setIndex_uptime_format(TimeUtil.Date2String(im.getIndex_uptime(), format));
			row.add(JSON.toJSON(im));
		}
		jarr.put("rows", row);
		return jarr;
	}
	
	/**
	 * 获取所有标签
	 * @param list
	 * @return
	 */
	public static JSONArray getAllLabel(List<LabelModel> list){
		JSONArray jarr = new JSONArray();
		for (LabelModel labelModel : list) {
			JSONObject jo = new JSONObject();
			jo.put("value", labelModel.getLabel_name());
			jarr.add(jo);
		}
		return jarr;
	}

	/**
	 * 获取所有评论
	 * @param list
	 * @param total
	 * @return
	 * @throws ParseException 
	 */
	public static JSONObject getComment(List<CommentModel> list,int total) throws ParseException{
		JSONObject jarr =  new JSONObject();
		jarr.put("total", total);
		jarr.put("rows", JSON.toJSON(list));
		return jarr;
	}
	
	/**
	 * 解析省
	 * @param coolWeatherDB
	 * @param response
	 * @return
	 */
	public static JSONArray getCorP(String response){
		JSONArray jarr = new JSONArray();
		if (response!=null && !"".equals(response)) {
			String[] allProvinces = response.split(",");
			if (allProvinces != null && allProvinces.length > 0) {
				for (String string : allProvinces) {
					String [] array = string.split("\\|");
					JSONObject jo = new JSONObject();
					jo.put("name", array[1]);
					jo.put("code", array[0]);
					jarr.add(jo);
				}
				return jarr;
			}
		}
		return null;
	}
	
	/**
	 * 解析所有办卡带审核的数据
	 * @param list
	 * @param total
	 * @return
	 * @throws ParseException 
	 */
	public static JSONObject getCardCheckList(List<CheckUserAndCardModel> list,int total) throws ParseException{
		JSONObject jo =  new JSONObject();
		jo.put("total", total);
		JSONArray jarr = new JSONArray();
		for (CheckUserAndCardModel checkUserAndCardModel : list) {
			checkUserAndCardModel.setCard_face("<img class='cardface' src="+checkUserAndCardModel.getCard_face()+">");
			checkUserAndCardModel.setUser_face("<img class='userface' src="+checkUserAndCardModel.getUser_face()+">");
			checkUserAndCardModel.setUser_regist_time_fmt(TimeUtil.Date2String(checkUserAndCardModel.getUser_regist_time(),"yyyy-MM"));
			checkUserAndCardModel.setCard_check_time_fmt(TimeUtil.Date2String(checkUserAndCardModel.getCard_check_time(),"yyyy-MM-dd HH:mm:ss"));
			jarr.add(JSON.toJSON(checkUserAndCardModel));
		}
		jo.put("rows", jarr);
		return jo;
	}
	
	/**
	 * 获得新信息
	 * @param mm
	 * @return
	 */
	public static JSONObject getNewMsgJSON(MsgModel mm){
		JSONObject jo = new JSONObject();
		if (mm==null) {
			jo.put("ishaveNew", false);
		}else{
			jo.put("ishaveNew", true);
			jo.put("msg", JSON.toJSON(mm));
		}
		
		return jo;
	}
	
	/**
	 * 获得用户卡列表
	 * @param list
	 * @return
	 */
	public static JSONObject getUserCardList(List<UserCardListModel> list){
			JSONObject jo = new JSONObject();
			if (list!=null&&list.size()!=0) {
				jo.put("error", 200);
				jo.put("msg", JSON.toJSON(list));
			}else{
				jo.put("error", 203);
				jo.put("msg", "获取用户卡列表失败");
			}
		return jo;
	}
	
	public static JSONObject getRecentlyTradeUser(List<UserModel> list){
		JSONObject jo = new JSONObject();
		if (list!=null&&list.size()!=0) {
			jo.put("error", 200);
			jo.put("msg", JSON.toJSON(list));
		}else{
			jo.put("error", 203);
			jo.put("msg", "获取最近相关交易人员列表失败！");
		}
		return jo;
	}

	public static JSONObject getTradeList(int total,List<TradeModel> findTradeByPage) throws ParseException {
		JSONObject jo = new JSONObject();
		jo.put("total", total);
		JSONArray jarr = new JSONArray();
		for (TradeModel tradeModel : findTradeByPage) {
			tradeModel.setTradeTimefmt(TimeUtil.Date2String(tradeModel.getTradeTime(), "MM/dd HH:mm"));
			tradeModel.setTradeIncomeMoneystr("<span style='color: green'>"+tradeModel.getTradeIncomeMoney()+"</span>");
			tradeModel.setTradeExpendMoneystr("<span style='color: red'>"+tradeModel.getTradeExpendMoney()+"</span>");
			tradeModel.setTradeTypeImage("<img src="+tradeModel.getTradeTypeImage()+" class='tradetypeimage img-circle'>");
			jarr.add(JSON.toJSON(tradeModel));
		}
		jo.put("rows", jarr);
		return jo;
	}
	
	/**
	 * 获得在线用户列表
	 * @return
	 * @throws ParseException 
	 * @throws CloneNotSupportedException 
	 */
	public static JSONObject getOnLineUser() throws ParseException, CloneNotSupportedException{
		JSONObject jo = new JSONObject();
		if (RegularUtil.UserLoginMap==null) {
			jo.put("total", 0);
			jo.put("rows", null);
			return jo;
		}
		JSONArray jarr = new JSONArray();
		for (Map.Entry<UserModel, String> entry : RegularUtil.UserLoginMap.entrySet()) {
			UserModel um = entry.getKey().clone();
			switch (um.getUser_state()) {
			case "1":
				um.setUser_state("正常");
				break;
			case "2":
				um.setUser_state("禁封");		
				break;
			case "0":
				um.setUser_state("未激活");
				break;
			default:
				break;
			}
			um.setUser_regist_time_fmt(TimeUtil.Date2String(entry.getKey().getUser_regist_time(), "yyyy-MM-dd HH:mm:ss"));
			um.setUser_face("<img class='userface' src="+entry.getKey().getUser_face()+">");
			jarr.add(JSON.toJSON(um));
		}
		jo.put("total", RegularUtil.UserLoginMap.size());
		jo.put("rows", jarr);
		return jo;
	}
}
