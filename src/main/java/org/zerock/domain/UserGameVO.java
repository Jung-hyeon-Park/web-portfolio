package org.zerock.domain;

public class UserGameVO {

	private int userIdx;
	private int[] category2Idxes;
	private int category2Idx;
	private int age;
	private int boardIdx;
	private int gameIdx;

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

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
