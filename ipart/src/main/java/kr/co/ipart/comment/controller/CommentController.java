package kr.co.ipart.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ipart.comment.service.CommentService;
import kr.co.ipart.repository.domain.Comment;


@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	CommentService service;
	
	
	@RequestMapping("/write.ipart")
	public int write(Comment comment) {
		return service.writeComment(comment);
	}
	
	@RequestMapping("/modify.ipart")
	public int modify(Comment comment) {
		return service.updateComment(comment);
	}
	
	@RequestMapping("/delete/{no}.ipart")
	public int delete(@PathVariable int no) {
		return service.deleteComment(no);
	}
}
