package org.zerock.domain;

public class GameVO {

	private int idx;
	private String title;
	private int price;
	private String status;
	private String condition;
	private int boardIdx;
	private int gameClassificationIdx;

	public int getGameClassificationIdx() {
		return gameClassificationIdx;
	}

	public void setGameClassificationIdx(int gameClassificationIdx) {
		this.gameClassificationIdx = gameClassificationIdx;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

}
