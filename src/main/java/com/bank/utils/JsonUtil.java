package com.bank.utils;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.index.IndexModel;
import com.bank.model.other.CityModel;
import com.google.gson.Gson;

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
	public static JSONArray getNotice(List<IndexModel> ilist){
		JSONArray jarr =  new JSONArray();
		for (IndexModel im : ilist) {
			jarr.add(gson.toJson(im));
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
