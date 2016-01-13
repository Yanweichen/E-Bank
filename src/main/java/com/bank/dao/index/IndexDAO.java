package com.bank.dao.index;


import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.index.IndexModel;

/**
 * @author yanwe
 *	主页DAO
 */
public interface IndexDAO extends BaseDAO<IndexModel>{
	
	public List<IndexModel> selectByNum(Integer num);
	public List<IndexModel> selectByTypeForIndex(Integer type);
}
