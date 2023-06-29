package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//pageNum과 amount 값을 같이 전달하는 용도
public class Criteria {
	//page번호
	private int pageNum;
	//page당 출력될 갯수
	private int amount;
	
	//생성자를 통해 기본값을 1페이지, 페이지당 10개로 지정
	public Criteria() {
		this(1,20);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
