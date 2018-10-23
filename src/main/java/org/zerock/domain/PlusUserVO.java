package org.zerock.domain;

public class PlusUserVO {

	private int[] category2Idx;
	private int[] genreIdx;
	private int userIdx;
	private int age;

	public int[] getCategory2Idx() {
		return category2Idx;
	}

	public void setCategory2Idx(int[] category2Idx) {
		this.category2Idx = category2Idx;
	}

	public int[] getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int[] genreIdx) {
		this.genreIdx = genreIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
