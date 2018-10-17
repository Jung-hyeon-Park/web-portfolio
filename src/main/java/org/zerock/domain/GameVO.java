package org.zerock.domain;

public class GameVO {

	private int idx;
	private String title;
	private int price;
	private int status;
	private int condition;
	private int category3Idx;
	private int boardIdx;
	
	

	public int getCategory3Idx() {
		return category3Idx;
	}

	public void setCategory3Idx(int category3Idx) {
		this.category3Idx = category3Idx;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
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
