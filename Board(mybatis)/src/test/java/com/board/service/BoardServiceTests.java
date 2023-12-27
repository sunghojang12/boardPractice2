package com.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.model.BoardVO;

import lombok.extern.log4j.Log4j;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	
	@Autowired
    private BoardService service;
	/* 게시판 등록 테스트 */
	@Test
    public void testEnroll() {
        
        BoardVO vo = new BoardVO();
        
        vo.setTitle("service test");
        vo.setContent("service test");
        vo.setWriter("service test");
        
        service.enroll(vo);
    }
	/* 게시판 목록 테스트 */
	@Test
	public void testGetList() {
		
		List<BoardVO> list = service.getList();
		
		list.forEach(board -> log.info(""+board));
	}
	/* 게시판 상세 조회 */
	@Test
	public void testGetDetail() {
		
		log.info("" + service.getDetail(5));
	}
}
