package com.bank.base;

import java.util.List;

public interface BaseService <T>{

	public void add(T model);
	
	public void RemoveById(Integer id);
	
	public void alterById(Integer id);
	
	public T findById(Integer id);
	
	public List<T> findAll();
}
