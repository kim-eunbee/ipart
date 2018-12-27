package kr.co.ipart.repository.mapper;

import java.util.List;

import kr.co.ipart.repository.domain.Board;
import kr.co.ipart.repository.domain.Comment;
import kr.co.ipart.repository.domain.Recom;

public interface BoardMapper {
	List<Board> selectBoard(String category);
	Board selectBoardDetail(int no);
	int insertBoard(Board board);
	int updateBoard(Board board);
	int deleteBoard(int no);
	int countView(Recom recom);
	
	
	
	List<Board> searchByWriter(Board board);
	List<Board> searchByTitle(Board board);
	List<Board> searchByContnet(Board board);
	List<Board> searchByUni(Board board);
}
