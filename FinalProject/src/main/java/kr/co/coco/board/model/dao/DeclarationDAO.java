package kr.co.coco.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.DeclarationDTO;

@Repository
public class DeclarationDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    //신고하기 
    public boolean report(DeclarationDTO declarationDto) {
        try {
            String declarationType = declarationDto.getDeclarationType();
            int result;

            switch (declarationType) {
                case "info":
                case "infoComment":
                    result = sqlSession.insert("declarationMapper.insertInfoDeclaration", declarationDto);
                    break;
                case "free":
                case "free_comment":
                    result = sqlSession.insert("declarationMapper.insertFreeDeclaration", declarationDto);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid declaration type: " + declarationType);
            }

            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



}
