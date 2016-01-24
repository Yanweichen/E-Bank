package com.bank.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.index.IndexDAO;
import com.bank.model.index.IndexModel;
import com.bank.model.other.Page;

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
	
	public int findCountByTableName(String name){
		return indexdao.selectCountByTableName(name);
	}
	/**
	 * 分页
	 * @param page
	 * @return
	 */
	public List<IndexModel> findeByPage(Page page){
		return indexdao.selectByPage(page);
	}
	
	public List<IndexModel> findeByTypeForIndex(Integer type){
		return indexdao.selectByTypeForIndex(type);
	}
	
	public int findNumByState(Integer state){
		return indexdao.selectNumByState(state);
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
	public List<IndexModel> findAboutByLabel(String label,int num){
		if (label==null||"".equals(label)) {
			return indexdao.selectAboutByLabel("NULL", num);
		} else {
			String [] labels = label.split(",");
			StringBuilder labelssb = new StringBuilder();
			for (String string : labels) {
				labelssb.append("\""+string+"\",");
			}
			return indexdao.selectAboutByLabel(labelssb.substring(0,labelssb.length()-1).toString(), num);
		}
	}
	
	@Override
	public int add(IndexModel model) {
		// TODO Auto-generated method stub
		try {
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
