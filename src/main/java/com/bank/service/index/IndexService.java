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
	public int add2View(IndexModel im){
		return indexdao.insertView(im);
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
	
	@Override
	public int add(IndexModel model) {
		// TODO Auto-generated method stub
		return indexdao.insert(model);
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
