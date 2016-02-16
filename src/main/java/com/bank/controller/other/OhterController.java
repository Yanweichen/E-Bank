package com.bank.controller.other;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.utils.QclodImageUtil;

@Controller
@RequestMapping("/other")
public class OhterController {

	/**
	 * 操作图片
	 * @param type
	 * @param fileid
	 */
	@ResponseBody
	@RequestMapping("/getImageSignature")
	public JSONObject getImageSignature(String type,String fileid){
		return QclodImageUtil.getSignatrue(type, fileid);
	}
}
