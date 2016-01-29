package com.bank.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.base.BaseService;
import com.bank.dao.index.CommentDAO;
import com.bank.model.index.CommentModel;
import com.bank.model.other.CommentPage;

@Service
public class CommentService implements BaseService<CommentModel>{

	@Autowired
	private CommentDAO cdao;
	
	public List<CommentModel> findComment(CommentPage cp){
		return cdao.selectComment(cp); 
	}
	public List<CommentModel> findAllComment(CommentPage cp){
		return cdao.selectAllComment(cp); 
	}
	
	public int selectCount(CommentPage cp){
		return cdao.selectCount(cp);
	}
	
	@Override
	public int add(CommentModel model) {
		// TODO Auto-generated method stub
		return cdao.insert(model);
	}

	@Override
	public int RemoveById(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterById(CommentModel model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommentModel findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommentModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
