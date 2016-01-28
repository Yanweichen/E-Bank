package com.bank.dao.index;

import java.util.List;

import com.bank.base.BaseDAO;
import com.bank.model.index.CommentModel;
import com.bank.model.other.CommentPage;

public interface CommentDAO extends BaseDAO<CommentModel> {

	public List<CommentModel> selectComment(CommentPage cp);
	public int selectCount(CommentPage cp);
}
