package org.zerock.domain;

public class GameDTO {

	private int price;
	private int boardIdx;
	private int category2Idx;
	private int category3Idx;
	private String status;
	private String state;
	private String name2;
	private String name3;
	private int saleComplete;

	public int getSaleComplete() {
		return saleComplete;
	}

	public void setSaleComplete(int saleComplete) {
		this.saleComplete = saleComplete;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getName3() {
		return name3;
	}

	public void setName3(String name3) {
		this.name3 = name3;
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
