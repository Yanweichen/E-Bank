package com.bank.base;

import java.util.List;

public interface BaseService <T>{

	public int add(T model);
	
	public int RemoveById(Integer id);
	
	public int alterById(T model);
	
	public T findById(Integer id);
	
	public List<T> findAll();
}
