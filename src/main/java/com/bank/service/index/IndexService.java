package com.bank.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.index.IndexDAO;
import com.bank.model.index.IndexModel;

/**
 * @author yanwe
 * 首页服务层
 */
@Service
public class IndexService implements BaseService<IndexModel> {

	@Autowired
	private IndexDAO indexdao;
	
	public List<IndexModel> findeByNum(Integer num){
		return indexdao.selectByNum(num);
	}
	
	public void add(IndexModel model) {
		// TODO Auto-generated method stub
		
	}

	public void RemoveById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	public void alterById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	public IndexModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<IndexModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
