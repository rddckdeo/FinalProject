package kr.co.coco.admin.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdminPageInfo {
	private int visitListCount;
	
	private int cpage;
	
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	private int offset;
	
	public AdminPageInfo(int visitListCount,int pageLimit,int boardLimit,
			int maxPage,int  startPage,int endPage,int offset) {
		this.visitListCount = visitListCount;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.offset = offset;
	}
	
}
