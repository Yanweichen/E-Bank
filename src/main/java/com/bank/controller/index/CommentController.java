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
import com.bank.model.other.CommentPage;
import com.bank.service.index.CommentService;
import com.bank.utils.JsonUtil;

@RequestMapping("/comment")
@Controller
public class CommentController {

	@Autowired
	private CommentService cs;
	
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
			jo.put("msg", "添加成功");
		} else {
			jo.put("error", "203");
			jo.put("msg", "添加失败");
		}
		return jo;
	}
}
