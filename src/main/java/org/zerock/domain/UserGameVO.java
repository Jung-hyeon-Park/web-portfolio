package org.zerock.domain;

public class UserGameVO {

	private int userIdx;
	private int[] category2Idxes;
	private int category2Idx;
	private int age;
	
	

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int[] getCategory2Idxes() {
		return category2Idxes;
	}

	public void setCategory2Idxes(int[] category2Idxes) {
		this.category2Idxes = category2Idxes;
	}

	public int getCategory2Idx() {
		return category2Idx;
	}

	public void setCategory2Idx(int category2Idx) {
		this.category2Idx = category2Idx;
	}
	
	

	
}
