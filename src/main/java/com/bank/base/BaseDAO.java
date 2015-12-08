package com.bank.base;

import java.util.List;

/**
 * @author yanwe
 *	基础接口
 * @param <T>
 */
public interface BaseDAO<T> {

	public void insert(T model);
	public void deleteById(Integer id);
	public void updateById(Integer id);
	public T selectById(Integer id);
	public List<T> selectAll();
}
