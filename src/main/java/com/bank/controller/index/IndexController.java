package com.bank.controller.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.index.IndexModel;
import com.bank.service.index.IndexService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService is;
	
	@ResponseBody
	@RequestMapping("/notice")
	public JSONArray getNotice(@RequestParam("num")Integer num,HttpServletRequest req){
			return JsonUtil.getNotice(is.findeByNum(num));
	}
	
	/**
	 * 获取首页公告或活动
	 * @param type 
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/indexnotice")
	public JSONArray getNoticeByTypeForIndex(@RequestParam("type")Integer type,HttpServletRequest req){
		return JsonUtil.getNotice(is.findeByTypeForIndex(type));
	}
	
	
	@RequestMapping("/session")
	public String getTestSession(HttpServletRequest req){
		req.getSession().invalidate();
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/addnotice")
	public JSONObject addNewNotice(IndexModel im){
		int isSuC = is.add(im);
		JSONObject jo = new JSONObject();
		if (isSuC==1) {
			jo.put("error", "200");
			jo.put("msg", "添加成功");
		}else{
			jo.put("error", "200");
			jo.put("msg", "添加失败");
		}
		return jo;
	}
	
	@RequestMapping("/myBank")
	public String gotoMyBank(){
		return "bus_index";
	}
	@RequestMapping("/index")
	public String gotoIndex(){
		return "index";
	}
}
