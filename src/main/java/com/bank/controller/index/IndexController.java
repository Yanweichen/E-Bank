package com.bank.controller.index;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.admin.AdminModel;
import com.bank.model.index.IndexModel;
import com.bank.model.other.Page;
import com.bank.service.index.IndexService;
import com.bank.utils.JsonUtil;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService is;
	
	@ResponseBody
	@RequestMapping("/notice")
	public JSONObject getNotice(@RequestParam("num")Integer num,HttpServletRequest req){
		List<IndexModel> list = is.findeByNum(num);
			return JsonUtil.getNotice(list,list.size(),"YYYY-MM-dd HH:mm:ss");
	}
	
	/**
	 * 获取首页公告或活动
	 * @param type 0 全部 1公告 2活动
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/indexnotice")
	public JSONObject getNoticeByTypeForIndex(@RequestParam("type")Integer type,HttpServletRequest req){
		if (type==0) {
			List<IndexModel> list = is.findAll();
			return JsonUtil.getNotice(list, list.size(),"YYYY-MM-dd HH:mm:ss");
		}
		List<IndexModel> list = is.findeByTypeForIndex(type);
		return JsonUtil.getNotice(list,list.size(),"MM/dd");
	}
	
	
	@RequestMapping("/session")
	public String getTestSession(HttpServletRequest req){
		req.getSession().invalidate();
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/addnotice")
	public JSONObject addNewNotice(IndexModel im,HttpServletRequest req){
		HttpSession session = req.getSession();
		AdminModel am = (AdminModel) session.getAttribute("admin");
		JSONObject jo = new JSONObject();
		if (im==null||am==null) {
			jo.put("error", "200");
			jo.put("msg", "添加失败");
			return jo;
		}
		im.setIndex_uptime(new Date());
		im.setUpfrom(am.getAdmin_id());
		int isSuC = is.add(im);
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
	
	private Page getPage(String page,String rows){
		//当前页  
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);  
        //每页显示条数  
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);  
        //每页的开始记录  第一页为1  第二页为number +1   
        int start = (intPage-1)*number; 
        Page p = new Page();
        p.setStart(start);
        p.setMax(number);
        return p;
	}
}
