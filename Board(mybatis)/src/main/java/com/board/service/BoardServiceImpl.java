package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	/* 게시판 등록 */
	@Override
	public void enroll(BoardVO board) {
		
		mapper.enroll(board);
	}
	/* 게시판 목록 */
	@Override
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}
	@Override
	public BoardVO getDetail(int bno) {
		
		return mapper.getDetail(bno);
	}
	@Override
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}
	@Override
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}
	
}
