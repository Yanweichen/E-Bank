package com.bank.dao.index;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bank.base.BaseDAO;
import com.bank.model.index.IndexModel;
import com.bank.model.index.LabelModel;
import com.bank.model.other.Page;

/**
 * @author yanwe
 *	主页DAO
 */
public interface IndexDAO extends BaseDAO<IndexModel>{
	
	public List<IndexModel> selectByPage(Page page);
	public int selectCountByType(@Param("pid")Integer pid,@Param("isView")String isView);
	public IndexModel selectTopByState(Integer state); 
	public int insertView(int id);
	public int deleteByIdView(int id);
	public int seletHitsNumById(int id);
	public int updateHitsNum(int num,int id);
	public IndexModel selectOneByBeforeOrAfter(@Param("ba")String ba,@Param("id")int id);
	public void insertLabel(int id,String label);
	public List<IndexModel> selectAboutByLabel(@Param("page")Page page,@Param("labels")String labels);
	public List<LabelModel> selectAllLabel();
	public int selectAboutByLabelCount(String label);
	public List<LabelModel> selectHotLabel(Integer num);
}
