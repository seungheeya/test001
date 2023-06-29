package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList(); //전체 조회
	
	public List<BoardVO> getListWithPaging(Criteria cri); //
	
	public void insert(BoardVO board); //삽입 key알 필요 X
	
	public Integer insertSelectKey(BoardVO board); //삽입 key알 필요 O
	
	public BoardVO read(Long bno); //글 1개 조회
	
	public int delete(Long bno); //글 1개 삭제
	
	public int update(BoardVO board); //수정
	
	public int getTotalCount(Criteria cri); //
}
