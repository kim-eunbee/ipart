package kr.co.ipart.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ipart.repository.domain.Board;
import kr.co.ipart.repository.mapper.BoardMapper;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<Board> boardList(String category) {
		return mapper.selectBoard(category);
	}
	
	@Override
	public Board boardDetail(int no) {
		return mapper.selectBoardDetail(no);
	}
	
	@Override
	public int boardWrite(Board board) {
		return mapper.insertBoard(board);
	}
	
	@Override
	public int boardUpdate(Board board) {
		return mapper.updateBoard(board);
	}
	
	@Override
	public int boardDelete(int no) {
		return mapper.deleteBoard(no);
	}

	@Override
	public List<Board> searchWriter(Board board) {
		return mapper.searchByWriter(board);
	}

	@Override
	public List<Board> searchByTitle(Board board) {
		return mapper.searchByTitle(board);
	}

	@Override
	public List<Board> searchByContnet(Board board) {
		return mapper.searchByContnet(board);
	}

	@Override
	public List<Board> searchByUni(Board board) {
		return mapper.searchByUni(board);
	}

}
