package kr.co.coco.mypage.common.paging;

public class mypagePagination {
	public static mypagePageInfo getPageInfo(int visitListCount, int cpage, 
			int pageLimit, int boardLimit){
		int maxPage = (int)(Math.ceil((double)visitListCount/boardLimit));
		int startPage = (int)(Math.ceil((double)cpage / pageLimit) * pageLimit) + 1;
		int endPage = startPage + pageLimit - 1;
		int offset = (cpage - 1) * boardLimit;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new mypagePageInfo(visitListCount, cpage, pageLimit, boardLimit,
								maxPage, startPage, endPage, offset);
	}
}
