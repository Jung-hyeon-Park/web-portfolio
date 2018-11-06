package org.zerock.domain;

public class GameListVO {

	private String title;
	private int price;
	private int boardIdx;
	private int category3Idx;
	private int category2Idx;
	private String status;
	private String state;
	private String email;
	private String likeCount;
	private String fullName;
	private int categoryIdx;
	private int saleComplete;

	public int getSaleComplete() {
		return saleComplete;
	}

	public void setSaleComplete(int saleComplete) {
		this.saleComplete = saleComplete;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
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

	public int getCategory3Idx() {
		return category3Idx;
	}

	public void setCategory3Idx(int category3Idx) {
		this.category3Idx = category3Idx;
	}

	public int getCategory2Idx() {
		return category2Idx;
	}

	public void setCategory2Idx(int category2Idx) {
		this.category2Idx = category2Idx;
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
