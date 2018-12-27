package kr.co.ipart.board.service;

import java.util.List;

import kr.co.ipart.repository.domain.Board;

public interface BoardService {
	List<Board> boardList(String category);
	Board boardDetail(int no);
	int boardWrite(Board board);
	int boardUpdate(Board board);
	int boardDelete(int no);
	
	
	List<Board> searchWriter(Board board);
	List<Board> searchByTitle(Board board);
	List<Board> searchByContnet(Board board);
	List<Board> searchByUni(Board board);
	
	
	
}
