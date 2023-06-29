package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//���������� getPageNum()���� ��������ȣ�� �������� 10.0���� ������ Math.ceil()�� ���� �ø��Ѵ�. �׸��� 10�� ���Ѵ�.
		//���������� ������������ ���ϱ� ���� ����
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		//������������ ������ ������������ 9�� ���� ��.
		this.startPage = this.endPage - 9;
		
		//��¥ ���������� ��ü �����Ͱ����� getAmount()�� ���� �� �������� ������ ������ �ø��Ͽ� ���Ѵ�.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		//��¥ ���������� ������������ �۴ٸ� ��¥ ���������� ���������� �ȴ�.
		//����)) �����Ͱ��� : 128�� , Amount : 10�� --> realEnd : 13 , endPage : 20
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
