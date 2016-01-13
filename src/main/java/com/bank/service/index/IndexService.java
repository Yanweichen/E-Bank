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
	
	public List<IndexModel> findeByTypeForIndex(Integer type){
		return indexdao.selectByTypeForIndex(type);
	}

	@Override
	public int add(IndexModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public IndexModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IndexModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
