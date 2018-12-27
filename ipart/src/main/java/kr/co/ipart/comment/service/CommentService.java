package kr.co.ipart.comment.service;

import kr.co.ipart.repository.domain.Comment;

public interface CommentService {
	int writeComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(int no);
}
