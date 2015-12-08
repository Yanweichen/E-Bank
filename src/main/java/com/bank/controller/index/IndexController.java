package com.bank.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.bank.service.index.IndexService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService is;
	
	@ResponseBody
	@RequestMapping("/notice")
	public JSONArray getNotice(@RequestParam("num")Integer num){
		return JsonUtil.getNotice(is.findeByNum(num));
	}
}
