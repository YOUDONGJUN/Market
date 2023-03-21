package com.bit.mybatis.board;

import com.bit.board.dto.BoardDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

    public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);

    public List<BoardDTO> qna(@Param("s") int start, @Param("e") int end);

    public List<BoardDTO> myPageList(@Param("s") int start, @Param("e") int end, @Param("id") String id);

    public List<BoardDTO> qnaMyPageList(@Param("s") int start, @Param("e") int end, @Param("id") String id);

    public List<BoardDTO> NoticeList(@Param("s") int start, @Param("e") int end);

    public int writeSave(BoardDTO dto);

    public int NoticeWriteSave(BoardDTO dto);

    public int qnaWriteSave(BoardDTO dto);

    public BoardDTO contentView(int product_no);

    public BoardDTO NoticeView(int product_no);

    public BoardDTO qnaContentView(int product_no);

    public int modify(BoardDTO dto);

    public int NoticeModify(BoardDTO dto);

    public int qnaModify(BoardDTO dto);

    public int delete(int product_no);

    public int qnaDelete(int product_no);

    public int selectBoardCount();

    public int qnaSelectBoardCount();

    public int mySelectBoardCount(@Param("id") String id);

    public int qnaMySelectBoardCount(@Param("id") String id);

    public List<BoardDTO> listAll(String searchOption, String keyword);

    public int countArticle(String searchOption, String keyword);

    public List<BoardDTO> BlistAll(Map<String, String> map);

    public int BcountArticle(Map<String, String> map);

    public List<BoardDTO> QlistAll(Map<String, String> map);

    public int QcountArticle(Map<String, String> map);


}
