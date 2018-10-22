package org.zerock.domain;

public class SimpleBoardDTO {

	private int idx;
	private int postCategoryIdx;
	private String fullName;
	private String title;
	
	

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getPostCategoryIdx() {
		return postCategoryIdx;
	}

	public void setPostCategoryIdx(int postCategoryIdx) {
		this.postCategoryIdx = postCategoryIdx;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
