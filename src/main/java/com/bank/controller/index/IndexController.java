package com.bank.controller.index;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bank.model.admin.AdminModel;
import com.bank.model.index.IndexModel;
import com.bank.model.other.Page;
import com.bank.service.index.IndexService;
import com.bank.utils.JsonUtil;
import com.bank.utils.TimeUtil;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService is;
	
	@ResponseBody
	@RequestMapping("/Allnotice")
	public JSONObject getNotice(Page page,HttpServletRequest req) throws ParseException{
		if ("index_uptime_format".equals(page.getSort())) {
			page.setSort("index_uptime");
		}
		page.setTableName("index_entry");
		List<IndexModel> list = is.findeByPage(page);
			return JsonUtil.getNotice(list,is.findCountByTableName("index_entry"),"yyyy-MM-dd HH:mm:ss");
	}

	@ResponseBody
	@RequestMapping("/Viewnotice")
	public JSONObject getViewNotice(Page page,HttpServletRequest req) throws ParseException{
		if ("index_uptime_format".equals(page.getSort())) {
			page.setSort("index_uptime");
		}
		page.setTableName("index_entry_view");
		List<IndexModel> list = is.findeByPage(page);
			return JsonUtil.getNotice(list,is.findCountByTableName("index_entry_view"),"yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * 获取首页公告或活动
	 * @param type 0 全部 1公告 2活动
	 * @param req
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping("/indexnotice")
	public JSONObject getNoticeByTypeForIndex(@RequestParam("type")Integer type,HttpServletRequest req) throws ParseException{
		if (type==0) {
			List<IndexModel> list = is.findAll();
			return JsonUtil.getNotice(list, is.findCountByTableName("index_entry_view"),"yyyy-MM-dd HH:mm:ss");
		}
		List<IndexModel> list = is.findeByTypeForIndex(type);
		return JsonUtil.getNotice(list,is.findCountByTableName("index_entry_view"),"MM/dd");
	}
	
	@ResponseBody
	@RequestMapping("/addnotice")
	public JSONObject addNewNotice(IndexModel im,HttpServletRequest req){
		HttpSession session = req.getSession();
		AdminModel am = (AdminModel) session.getAttribute("admin");
		JSONObject jo = new JSONObject();
		if (im==null||am==null) {
			jo.put("error", "203");
			jo.put("msg", "添加失败");
			return jo;
		}
		im.setIndex_uptime(new Date());
		im.setUpfrom(am.getAdmin_id());
		im.setIndex_state("00");//设置初始状态
		int isSuC = is.add(im);
		if (isSuC==1) {
			jo.put("error", "200");
			jo.put("msg", "添加成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "添加失败");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/updateNoticeState")
	public JSONObject updateIndexState(String row,String state){
		JSONObject jo = new JSONObject();//返回给页面的json
		IndexModel im = JSON.parseObject(row, IndexModel.class);//转换对象
		JSONObject jrow = JSON.parseObject(row);//传递回来的json
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			im.setIndex_uptime(sdf.parse(jrow.getString("index_uptime_format")));
		} catch (ParseException e) {
			e.printStackTrace();
			jo.put("error", "203");
			jo.put("msg", "修改失败");
		}
		im.setIndex_state(state);
		int isSuC = is.alterById(im);
		if (isSuC==1) {
			jo.put("error", "200");
			jo.put("msg", "修改成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "修改失败");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/add2View")
	public JSONObject add2View(int id){
		JSONObject jo = new JSONObject();//返回给页面的json
		int isSuC = is.add2View(id);
		if (isSuC==1) {
			jo.put("error", "200");
			jo.put("msg", "添加成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "添加失败");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getCountByState")
	public JSONObject getCountByState(Integer type){
		JSONObject jo = new JSONObject();//返回给页面的json
		int count = is.findNumByState(type);
		jo.put("error", "200");
		jo.put("count", count);
		return jo;
	}

	/**
	 * @param id
	 * @param type 0总表 1预览表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/removeById")
	public JSONObject deleteById(int id,int type){
		JSONObject jo = new JSONObject();//返回给页面的json
		int isSuc = 0;
		if (type==0) {
			isSuc = is.RemoveById(id);
		}else{
			isSuc = is.removeByIdView(id);
		}
		if (isSuc==1) {
			jo.put("error", "200");
			jo.put("msg", "删除成功");
		}else{
			jo.put("error", "203");
			jo.put("msg", "删除失败");
		}
		return jo;
	}
	
	@ResponseBody
	@RequestMapping("/getArticleById")
	public JSONObject getArticleById(int id) throws ParseException{
		JSONObject jo = new JSONObject();//返回给页面的json
		IndexModel im = is.findById(id);
		if (im==null) {
			jo.put("error", "203");
			jo.put("msg", "查询失败");
			return jo;
		}
		jo = JsonUtil.getSingleNotice(im,"yyyy-MM-dd HH:mm");
		return jo;
	}

	@RequestMapping("/articledetail")
	public ModelAndView gotoArticleDetails(int id) throws ParseException{
		ModelAndView mv = new ModelAndView();
		IndexModel im = is.findById(id);
		is.addHits(id);//增加点击量
		im.setIndex_uptime_format(TimeUtil.Date2String(im.getIndex_uptime(), "yyyy-MM-dd HH:mm"));
		mv.addObject("article",im);
		mv.setViewName("../page/article/articledetails");;
		return mv;
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
        p.setLimit(start);
        p.setOffset(number);
        return p;
	}
}
