package kr.co.coco.mypage.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class mypagePageInfo {
	private int visitListCount;
	
	private int cpage;
	
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	private int offset;
	

	
}
