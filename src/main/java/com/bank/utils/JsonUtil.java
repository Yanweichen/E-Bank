package com.bank.utils;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.bank.model.index.IndexModel;
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
}
