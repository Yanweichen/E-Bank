package com.bank.dao.index;


import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.index.IndexModel;
import com.bank.model.other.Page;

/**
 * @author yanwe
 *	主页DAO
 */
public interface IndexDAO extends BaseDAO<IndexModel>{
	
	public List<IndexModel> selectByPage(Page page);
	public List<IndexModel> selectByTypeForIndex(Integer type);
	public int selectCountByTableName(String name);
	public int selectNumByState(Integer state); 
	public int insertView(IndexModel im);
	public int deleteByIdView(int id);
}
