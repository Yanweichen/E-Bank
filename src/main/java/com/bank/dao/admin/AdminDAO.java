package com.bank.dao.admin;

import com.bank.base.BaseDAO;
import com.bank.model.admin.AdminModel;

public interface AdminDAO extends BaseDAO<AdminModel> {

	public AdminModel selectAdminByName(String admin_name);
}
