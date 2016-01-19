package com.bank.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.index.IndexModel;
import com.bank.model.other.CityModel;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class JsonUtil {

	private static Gson gson=null;
    static{
        if(gson==null){
            gson=new Gson();
        }
    }
	
	/**
	 * 获得公告
	 * @param ilist
	 * @return
	 */
	public static JSONObject getNotice(List<IndexModel> ilist,int total,String format){
		JSONObject jarr =  new JSONObject();
		jarr.put("total", total);
		JSONArray row =  new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		for (IndexModel im : ilist) {
			JSONObject jo = new JSONObject();
			jo.put("index_id", im.getIndex_id());
			jo.put("index_type", im.getIndex_type());
			jo.put("index_title", im.getIndex_title());
			jo.put("index_content", im.getIndex_content());
			jo.put("index_uptime_format", sdf.format(im.getIndex_uptime()));
			jo.put("upfrom", im.getUpfrom());
			jo.put("index_state", im.getIndex_state());
			row.add(jo);
//			row.add(gson.toJson(im));
		}
		jarr.put("rows", row);
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
