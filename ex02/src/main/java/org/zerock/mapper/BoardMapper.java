package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList(); //��ü ��ȸ
	
	public List<BoardVO> getListWithPaging(Criteria cri); //
	
	public void insert(BoardVO board); //���� key�� �ʿ� X
	
	public Integer insertSelectKey(BoardVO board); //���� key�� �ʿ� O
	
	public BoardVO read(Long bno); //�� 1�� ��ȸ
	
	public int delete(Long bno); //�� 1�� ����
	
	public int update(BoardVO board); //����
	
	public int getTotalCount(Criteria cri); //
}
