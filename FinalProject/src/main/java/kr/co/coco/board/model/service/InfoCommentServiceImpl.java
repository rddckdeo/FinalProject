package kr.co.coco.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dao.InfoCommentDAO;
import kr.co.coco.board.model.dto.InfoCommentDTO;


@Service
public class InfoCommentServiceImpl implements InfoCommentService{

	private InfoCommentDAO infoCommentDAO;

    @Autowired
    public InfoCommentServiceImpl(InfoCommentDAO infoCommentDAO) {
        this.infoCommentDAO = infoCommentDAO;
    }
    
    //댓글 저장 
    @Override
    public InfoCommentDTO save(InfoCommentDTO commentDTO) {
        return infoCommentDAO.save(commentDTO);
    }

    
}


