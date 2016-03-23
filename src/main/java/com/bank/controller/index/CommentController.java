package com.bank.controller.index;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.index.CommentModel;
import com.bank.model.msg.MsgModel;
import com.bank.model.other.CommentPage;
import com.bank.service.index.CommentService;
import com.bank.service.msg.MsgService;
import com.bank.utils.JsonUtil;

@RequestMapping("/comment")
@Controller
public class CommentController {

	@Autowired
	private CommentService cs;
	@Autowired
	private MsgService ms;
	
	@ResponseBody
	@RequestMapping("/getcomment")
	public JSONObject getCommentController(CommentPage cp) throws ParseException{
		List<CommentModel> list = cs.findAllComment(cp);
		return JsonUtil.getComment(list, cs.selectCount(cp));
	}
	
	@ResponseBody
	@RequestMapping("/addcomment")
	public JSONObject addComment(CommentModel cm){
		JSONObject jo = new JSONObject();
		cm.setComment_time(new Date());
		int isSuc = cs.add(cm);
		if (isSuc==1) {
			jo.put("error", "200");
			jo.put("msg", "success");
		} else {
			jo.put("error", "203");
			jo.put("msg", "failed");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getCount")
	public JSONObject getCount(CommentPage cp){
		JSONObject jo = new JSONObject();
		jo.put("error", "200");
		jo.put("total", cs.selectCount(cp));
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/sendNotice")
	public JSONObject sendNotice(String content,int user_id){
		JSONObject jo = new JSONObject();
		MsgModel mm = new MsgModel();
		mm.setMsgState(false);//no reade
		mm.setMsgTitle("You Have A New Message！");
		mm.setMsgContent(content);
		mm.setMsgType(3);//1 gonggao 2 huodon 3 tongzhi
		mm.setMsgUserId(user_id);
		mm.setMsgTime(new Date());
		int suc = ms.add(mm);
		if (suc==1) {
			jo.put("error", "200");
			jo.put("msg", "success");
		} else {
			jo.put("error", "203");
			jo.put("msg", "faild");
		}
		return jo;
	}
}
