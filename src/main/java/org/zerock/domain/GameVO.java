package org.zerock.domain;

public class GameVO {

	private int idx;
	private String title;
	private int price;
	private String status;
	private String condition;
	private int category3Idx;
	private int boardIdx;
	private int category2Idx;

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
