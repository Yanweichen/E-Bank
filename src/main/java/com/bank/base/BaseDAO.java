package com.bank.base;

import java.util.List;

/**
 * @author yanwe
 *	基础接口
 * @param <T>
 */
public interface BaseDAO<T> {

	public int insert(T model);
	public int deleteById(Integer id);
	public int updateById(T model);
	public T selectById(Integer id);
	public List<T> selectAll();
}
