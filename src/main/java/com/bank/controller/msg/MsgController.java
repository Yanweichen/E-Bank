package com.bank.controller.msg;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bank.model.msg.MsgModel;
import com.bank.model.user.UserModel;
import com.bank.service.msg.MsgService;
import com.bank.utils.JsonUtil;

@RequestMapping("/msg")
@Controller
public class MsgController {

	@Autowired
	private MsgService ms;
	
	/**
	 * 获取消息
	 * @param state
	 * @return
	 */
	@RequestMapping("/msgBox")
	public ModelAndView msgBox(@Param("state")String state,int offset,int limit,HttpServletRequest req){
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView();
		mv.addObject("msglist", ms.findMsgByState(state,offset,limit,Integer.valueOf(user.getUser_id())));
		mv.setViewName("myAccount/msgBox/msgbox");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/alertmsgstate")
	public JSONObject alertMsgState(int id){
		JSONObject jo = new JSONObject();
		int suc = ms.alertStateById(id);
		if (suc==1) {
			jo.put("error", "200");
			jo.put("msg", "修改成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "修改失败");
		}
		return jo;
	}
	
	/**
	 * 发送消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("sendMsg")
	public JSONObject sendMsg(MsgModel model){
		JSONObject jo = new JSONObject();
		model.setMsgTime(new Date());
		model.setMsgState(false);
		int suc = ms.add(model);
		if (suc==1) {
			jo.put("error", "200");
			jo.put("msg", "修改成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "修改失败");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getTotalByState")
	public JSONObject getTotalByState(String state,HttpServletRequest req){
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		JSONObject jo = new JSONObject();
		jo.put("error", "200");
		jo.put("msg", ms.findNumByState(state,Integer.valueOf(user.getUser_id())));
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getNewMsg")
	public JSONObject getNewMsg(HttpServletRequest req){
		UserModel user = (UserModel) req.getSession().getAttribute("user");
		return JsonUtil.getNewMsgJSON(ms.findNewMsg(Integer.valueOf(user.getUser_id())));
	}

	@ResponseBody
	@RequestMapping("/deleteMoreMsg")
	public JSONObject DeleteMoreMsg(@RequestParam("ids[]")int [] ids){
		JSONObject jo = new JSONObject();
		int suc = ms.removeByIdArray(ids);
		if (suc==ids.length) {
			jo.put("error", "200");
			jo.put("msg", "删除成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "删除失败");
		}
		return jo;
	}
}
