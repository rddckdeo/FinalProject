package kr.co.coco.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 게터
@Setter // 세터
@NoArgsConstructor

public class DeclarationDTO {
	
	private int declarationNo;
    private int mNo;
    private String declarationType;
    private int boardNo;
    private String declarationContent;
    private String declarationDate;
    private String declarationWithdrawal;
    
    private int infoCommentNo; // 댓글 번호


    @Override
    public String toString() {
        return "DeclarationDTO [declarationNo=" + declarationNo + ", mNo=" + mNo + ", declarationType="
                + declarationType + ", boardNo=" + boardNo + ", declarationContent=" + declarationContent
                + ", declarationDate=" + declarationDate + ", declarationWithdrawal=" + declarationWithdrawal + "]";
    }
    
}
