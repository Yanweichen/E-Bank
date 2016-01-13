package com.bank.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.dao.admin.AdminDAO;
import com.bank.model.admin.AdminModel;

@Service
public class AdminService {

	@Autowired
	private AdminDAO admindao;
	
	public AdminModel findAdminByName(String name){
		return admindao.selectAdminByName(name);
	}
}
