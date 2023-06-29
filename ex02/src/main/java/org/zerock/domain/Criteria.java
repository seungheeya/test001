package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//pageNum�� amount ���� ���� �����ϴ� �뵵
public class Criteria {
	//page��ȣ
	private int pageNum;
	//page�� ��µ� ����
	private int amount;
	
	//�����ڸ� ���� �⺻���� 1������, �������� 10���� ����
	public Criteria() {
		this(1,20);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
