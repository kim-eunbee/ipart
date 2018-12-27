package kr.co.ipart.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ipart.repository.domain.Comment;
import kr.co.ipart.repository.mapper.CommentMapper;
@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentMapper mapper;

	@Override
	public int writeComment(Comment comment) {
		return mapper.insertComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return mapper.updateComment(comment);
	}

	@Override
	public int deleteComment(int no) {
		return mapper.deleteComment(no);
	}
	
}
