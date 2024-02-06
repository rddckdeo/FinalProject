package kr.co.coco.admin.common.paging;

public class AdminPagination {
	public static AdminPageInfo getPageInfo(int visitListCount, int vcpage, int pageLimit, int boardLimit){
		int maxPage = (int)(Math.ceil((double)visitListCount/boardLimit));
		int startPage = (vcpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		int offset = (vcpage - 1) * boardLimit;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		return new AdminPageInfo(visitListCount, vcpage, pageLimit, boardLimit,
								maxPage, startPage, endPage, offset);
	}
}
