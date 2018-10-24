package org.zerock.domain;

public class GameDTO {

	private String title;
	private int price;
	private int boardIdx;
	private int category2Idx;
	private int category3Idx;
	private String status;
	private String state;

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

	public int getCategory2Idx() {
		return category2Idx;
	}

	public void setCategory2Idx(int category2Idx) {
		this.category2Idx = category2Idx;
	}

	public int getCategory3Idx() {
		return category3Idx;
	}

	public void setCategory3Idx(int category3Idx) {
		this.category3Idx = category3Idx;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
