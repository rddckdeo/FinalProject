package kr.co.coco.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dao.FreeCommentDAO;
import kr.co.coco.board.model.dto.FreeCommentDTO;

@Service
public class FreeCommentServiceImpl implements FreeCommentService {

    private FreeCommentDAO freeCommentDAO;

    @Autowired
    public FreeCommentServiceImpl(FreeCommentDAO freeCommentDAO) {
        this.freeCommentDAO = freeCommentDAO;
    }

    // 댓글 저장
    @Override
    public FreeCommentDTO save(FreeCommentDTO commentDTO) {
        return freeCommentDAO.save(commentDTO);
    }

    // 댓글 수 업데이트
    @Override
    public int countComments(int freeNo) {
        return freeCommentDAO.countComments(freeNo);
    }

    // 댓글 삭제
    @Override
    public int deleteById(int id) {
        return freeCommentDAO.delete(id);
    }

    // 댓글 번호로 게시글 번호 가져오기
    @Override
    public int getFreeNoFromComment(int freeCommentNo) {
        return freeCommentDAO.getFreeNoFromComment(freeCommentNo);
    }

    // 댓글 등록 시, free_comment_count 업데이트
    @Override
    public void increaseCommentCount(int freeNo) {
        freeCommentDAO.increaseCommentCount(freeNo);
    }

    // 해당 게시글에 연결된 모든 댓글 삭제
    @Override
    public void deleteCommentsByPostId(int freeNo) {
        freeCommentDAO.deleteCommentsByPostId(freeNo);
    }

}
