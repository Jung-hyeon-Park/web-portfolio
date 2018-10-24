package org.zerock.domain;

public class UserGenreVO {

	private int userIdx;
	private int[] genreIdxes;
	private int genreIdx;
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

	public int[] getGenreIdxes() {
		return genreIdxes;
	}

	public void setGenreIdxes(int[] genreIdxes) {
		this.genreIdxes = genreIdxes;
	}

	public int getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}

}
