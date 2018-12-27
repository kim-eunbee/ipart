package kr.co.ipart.repository.mapper;

import kr.co.ipart.repository.domain.Comment;

public interface CommentMapper {
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(int no);  
}
