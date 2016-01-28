package com.bank.service.index;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.util.Base64;
import com.bank.base.BaseService;
import com.bank.dao.index.IndexDAO;
import com.bank.model.index.IndexModel;
import com.bank.model.index.LabelModel;
import com.bank.model.other.IndexPage;

/**
 * @author yanwe
 * 首页服务层
 */
@Service
public class IndexService implements BaseService<IndexModel> {

	@Autowired
	private IndexDAO indexdao;
	
	/**
	 * 添加到首页表
	 * @param im
	 * @return
	 */
	public int removeByIdView(int id){
		return indexdao.deleteByIdView(id);
	}
	
	/**
	 * 添加到首页表
	 * @param im
	 * @return
	 */
	public int add2View(int id){
		return indexdao.insertView(id);
	}
	
	public int findCountByType(Integer pid,String isView){
		return indexdao.selectCountByType(pid,isView);
	}
	/**
	 * 分页
	 * @param indexPage
	 * @return
	 */
	public List<IndexModel> findeByPage(IndexPage indexPage){
		return indexdao.selectByPage(indexPage);
	}
	
	public IndexModel findTopByState(Integer state){
		return indexdao.selectTopByState(state);
	}
	
	public IndexModel findByBoA(String ba,int id){
		return indexdao.selectOneByBeforeOrAfter(ba, id);
	}
	/**
	 * 根据id增加点击量
	 * @param id
	 * @return
	 */
	public int addHits(int id){
		return indexdao.updateHitsNum(indexdao.seletHitsNumById(id), id);
	}
	
	/**
	 * 根据标签查询相关文章
	 * @param label
	 * @param num
	 * @return
	 */
	public List<IndexModel> findAboutByLabel(IndexPage indexPage){
		if (indexPage.getSearch()==null||"".equals(indexPage.getSearch())) {
			return indexdao.selectAboutByLabel(indexPage,"NULL");
		} else {
			String [] labels = indexPage.getSearch().split(",");
			StringBuilder labelssb = new StringBuilder();
			for (String string : labels) {
				labelssb.append("'"+string+"',");
			}
			return indexdao.selectAboutByLabel(indexPage,labelssb.substring(0,labelssb.length()-1).toString());
		}
	}
	/**
	 * 根据标签查询相关文章
	 * @param label
	 * @param num
	 * @return
	 */
	public int findAboutByLabelCount(IndexPage indexPage){
		if (indexPage.getSearch()==null||"".equals(indexPage.getSearch())) {
			indexPage.setSearch("NULL");
			return indexdao.selectAboutByLabelCount(indexPage.getSearch());
		} else {
			String [] labels = indexPage.getSearch().split(",");
			StringBuilder labelssb = new StringBuilder();
			for (String string : labels) {
				labelssb.append("'"+string+"',");
			}
			return indexdao.selectAboutByLabelCount(labelssb.substring(0,labelssb.length()-1).toString());
		}
	}
	
	public List<LabelModel> findAllLabel(){
		return indexdao.selectAllLabel();
	}
	public List<LabelModel> findeHotLabel(Integer num){
		return indexdao.selectHotLabel(num);
	}
	
	@Override
	public int add(IndexModel model) {
		// TODO Auto-generated method stub
//		FileOutputStream fos = null;
		try {
//			String baseURL = model.getIndex_preview_image_url();
//			byte[] file = Base64.decodeFast(baseURL);
//			String filname = "page/article/articleimg/"+UUID.randomUUID().toString()+".jpg";
//			fos = new FileOutputStream(filname);
//			fos.write(file);
//			fos.close();
//			model.setIndex_preview_image_url(filname);
			int pk = indexdao.insert(model);
			indexdao.insertLabel(model.getIndex_id(), model.getIndex_label());
			return pk;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	
	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return indexdao.deleteById(id);
	}


	@Override
	public IndexModel findById(Integer id) {
		// TODO Auto-generated method stub
		return indexdao.selectById(id);
	}

	@Override
	public List<IndexModel> findAll() {
		// TODO Auto-generated method stub
		return indexdao.selectAll();
	}
	@Override
	public int alterById(IndexModel model) {
		// TODO Auto-generated method stub
		return indexdao.updateById(model);
	}
	
}
