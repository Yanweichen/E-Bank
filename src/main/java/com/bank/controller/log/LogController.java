package com.bank.controller.log;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.other.TradePage;
import com.bank.service.log.LogService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("log")
public class LogController {

	@Autowired
	private LogService ls;
	
	@ResponseBody
	@RequestMapping("findAllLog")
	public JSONObject findAllLog(TradePage tp) throws ParseException{
		return JsonUtil.getLog(ls.findAllByPage(tp), ls.findAllCountByPage(tp));
	}
}
