package com.bank.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.index.IndexModel;
import com.bank.model.index.LabelModel;
import com.bank.model.other.CityModel;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

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
		}
		JSONArray row =  new JSONArray();
		for (IndexModel im : ilist) {
			im.setIndex_uptime_format(TimeUtil.Date2String(im.getIndex_uptime(), format));
			row.add(JSON.toJSON(im));
		}
		jarr.put("rows", row);
		return jarr;
	}
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
}
