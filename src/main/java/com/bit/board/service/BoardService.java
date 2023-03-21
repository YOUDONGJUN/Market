package com.bit.board.service;

import com.bit.board.dto.BoardDTO;
import com.bit.board.dto.QnaReplyDTO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface BoardService {

    public void boardAllList(Model model, int num);

    public void qna(Model model, int num);

    public void Notice(Model model, int num);

    public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);

    public String NoticeWriteSave(HttpServletRequest request);

    public String qnaWriteSave(MultipartHttpServletRequest mul, HttpServletRequest request);

    public void contentView(int product_no, Model model);

    public void NoticeView(int product_no, Model model);

    public void qnaContentView(int product_no, Model model);

    public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);

    public String NoticeModify(HttpServletRequest request);

    public String qnaModify(MultipartHttpServletRequest mul, HttpServletRequest request);

    public String boardDelete(int product_no, String product_img, HttpServletRequest request);

    public String NoticeDelete(int product_no, HttpServletRequest request);

    public String qnaBoardDelete(int product_no, String product_img, HttpServletRequest request);

    public List<QnaReplyDTO> readReply(int bno);

    public String reply(HttpServletRequest request);

    public void myPageList(Model model, int num, String id);

    public void qnaMyPageList(Model model, int num, String id);

    /////////////////////////////////////////////////////////////////

    public List<BoardDTO> BlistAll(String searchOption, String keyword);

    public int BcountArticle(String searchOption, String keyword);

    public List<BoardDTO> QlistAll(String searchOption, String keyword);

    public int QcountArticle(String searchOption, String keyword);


}
