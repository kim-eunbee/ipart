package kr.co.ipart.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import kr.co.ipart.board.service.BoardService;
import kr.co.ipart.comment.service.CommentService;
import kr.co.ipart.repository.domain.Board;
import kr.co.ipart.repository.domain.Comment;
import kr.co.ipart.repository.domain.Search;
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;

	
	
	@RequestMapping("/board.ipart")
	public void list() {
		
	}

	@ResponseBody
	@RequestMapping("/list/{category}/{pageNo}/{listSize}.ipart")
	public List<Board> list(@PathVariable String category, @PathVariable @RequestParam(value="pageNo", defaultValue="1") int pageNo, @PathVariable @RequestParam(value="listSizes", defaultValue="20") int listSize) {
		
		return service.boardList(category);
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("/detail/{no}.ipart")
	public Board detail(@PathVariable int no) {
		return service.boardDetail(no);
	}
	
	
	@ResponseBody
	@RequestMapping("/write.ipart")
	public int write(Board board) {
		 return service.boardWrite(board);
	}
	
	@ResponseBody
	@RequestMapping("/modify.ipart")
	public int modify(Board board) {
		return service.boardUpdate(board);
	}
	
	@ResponseBody
	@RequestMapping("/delete/{no}.ipart")
	public int delete(@PathVariable int no) {
		return service.boardDelete(no);
	}
	
	
	
	@ResponseBody
	@RequestMapping("/search.ipart")
	public List<Board> search(Search search, int paging){
		Board board = new Board();
		board.setStartPage((paging*10) -1);
		board.setEndPage(paging*10);
		board.setKeyWord(search.getKeyWord());
		if(search.getSerchType()=="writer") {
			return service.searchWriter(board);
		}else if(search.getSerchType()=="title") {
			return service.searchByTitle(board);
		}else if(search.getSerchType()=="content") {
			return service.searchByContnet(board);
		}
		return service.searchByUni(board);
	}
	
	
	
	
	
	
	

	
	
}
