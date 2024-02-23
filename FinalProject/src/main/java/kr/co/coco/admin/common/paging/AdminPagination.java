package kr.co.coco.admin.common.paging;

public class AdminPagination {
	public static AdminPageInfo getPageInfo(int visitListCount, int cpage, 
			int pageLimit, int boardLimit){
		int maxPage = (int)(Math.ceil((double)visitListCount/boardLimit));
		int startPage = (cpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		int offset = (cpage - 1) * boardLimit;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new AdminPageInfo(visitListCount, cpage, pageLimit, boardLimit,
								maxPage, startPage, endPage, offset);
	}
}
