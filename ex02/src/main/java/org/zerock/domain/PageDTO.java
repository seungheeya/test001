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
		
		//끝페이지는 getPageNum()으로 페이지번호를 가져오고 10.0으로 나누어 Math.ceil()을 통해 올림한다. 그리고 10을 곱한다.
		//끝페이지는 시작페이지를 구하기 위한 목적
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		//시작페이지는 무조건 끝페이지에서 9를 빼면 됨.
		this.startPage = this.endPage - 9;
		
		//진짜 끝페이지는 전체 데이터개수를 getAmount()를 통한 한 페이지당 갯수로 나누어 올림하여 구한다.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		//진짜 끝페이지가 끝페이지보다 작다면 진짜 끝페이지가 끝페이지가 된다.
		//예시)) 데이터갯수 : 128개 , Amount : 10개 --> realEnd : 13 , endPage : 20
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
