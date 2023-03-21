package com.bit.mybatis.board;

import com.bit.board.dto.BoardDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

    public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);

    public List<BoardDTO> qna(@Param("s") int start, @Param("e") int end);

    public List<BoardDTO> mypageList(@Param("s") int start, @Param("e") int end, @Param("id") String id);

    public List<BoardDTO> qnamypageList(@Param("s") int start, @Param("e") int end, @Param("id") String id);

    public List<BoardDTO> NoticeList(@Param("s") int start, @Param("e") int end);

    public int writeSave(BoardDTO dto);

    public int NoticeWriteSave(BoardDTO dto);

    public int qnawriteSave(BoardDTO dto);

    public BoardDTO contentView(int product_no);

    public BoardDTO NoticeView(int product_no);

    public BoardDTO qnacontentView(int product_no);

    public int modify(BoardDTO dto);

    public int NoticeModify(BoardDTO dto);

    public int qnamodify(BoardDTO dto);

    public int delete(int product_no);

    public int qnadelete(int product_no);

    public int selectBoardCount();

    public int qnaselectBoardCount();

    public int myselectBoardCount(@Param("id") String id);

    public int qnamyselectBoardCount(@Param("id") String id);

    public List<BoardDTO> listAll(String searchOption, String keyword);

    public int countArticle(String searchOption, String keyword);

    public List<BoardDTO> BlistAll(Map<String, String> map);

    public int BcountArticle(Map<String, String> map);

    public List<BoardDTO> QlistAll(Map<String, String> map);

    public int QcountArticle(Map<String, String> map);


}
