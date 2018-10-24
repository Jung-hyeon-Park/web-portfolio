package org.zerock.domain;

public class GameCategory1VO {

	private int idx;
	private int categoryIdx;
	private int category2Idx;
	private String name;
	private String name2;
	private String image;

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public int getCategory2Idx() {
		return category2Idx;
	}

	public void setCategory2Idx(int category2Idx) {
		this.category2Idx = category2Idx;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
