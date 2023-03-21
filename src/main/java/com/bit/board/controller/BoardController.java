package com.bit.board.controller;

import com.bit.board.dto.BoardDTO;
import com.bit.board.dto.QnaReplyDTO;
import com.bit.board.service.BoardFileService;
import com.bit.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("board")
public class BoardController {


    @Autowired
    BoardService boardService;

    @GetMapping("boardAllList")
    public String boardAllList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
        boardService.boardAllList(model, num);
        return "board/boardAllList";
    }

    // 01. 게시글 목록
    @RequestMapping("boardList.do")
    // @RequestParam(defaultValue="") ==> 기본값 할당
    public ModelAndView boardList(@RequestParam(defaultValue = "product_title") String searchOption,
                                  @RequestParam(defaultValue = "") String keyword) throws Exception {
        List<BoardDTO> list = boardService.BlistAll(searchOption, keyword);
        // 레코드의 갯수
        int count = boardService.BcountArticle(searchOption, keyword);
        // ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        // 데이터를 맵에 저장
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list); // list
        map.put("count", count); // 레코드의 갯수
        map.put("searchOption", searchOption); // 검색옵션
        map.put("keyword", keyword); // 검색키워드
        mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
        mav.setViewName("board/boardAllList"); // 뷰를 list.jsp로 설정
        return mav; // list.jsp로 List가 전달된다.
    }

    // 01. 게시글 목록
    @RequestMapping("qnaList.do")
    // @RequestParam(defaultValue="") ==> 기본값 할당
    public ModelAndView qnaList(@RequestParam(defaultValue = "product_title") String searchOption,
                                @RequestParam(defaultValue = "") String keyword) throws Exception {
        List<BoardDTO> list = boardService.QlistAll(searchOption, keyword);
        // 레코드의 갯수
        int count = boardService.QcountArticle(searchOption, keyword);
        // ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        // 데이터를 맵에 저장
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list); // list
        map.put("count", count); // 레코드의 갯수
        map.put("searchOption", searchOption); // 검색옵션
        map.put("keyword", keyword); // 검색키워드
        mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
        mav.setViewName("board/qna"); // 뷰를 list.jsp로 설정
        return mav; // list.jsp로 List가 전달된다.
    }


    @GetMapping("qna")
    public String qna(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
        boardService.qna(model, num);
        return "board/qna";
    }

    @GetMapping("myPageList")
    public String myPageList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num, @RequestParam("id") String id) {
        boardService.myPageList(model, num, id);
        return "board/myPageList";
    }

    @GetMapping("qnaMyPageList")
    public String qnaMyPageList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num, @RequestParam("id") String id) {
        boardService.qnaMyPageList(model, num, id);
        return "board/qnaMyPageList";
    }

    @GetMapping("Notice")
    public String Notice(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
        boardService.Notice(model, num);
        return "board/Notice";
    }

    @GetMapping("qnaNotice")
    public String qnaNotice() {
        return "board/qnaNotice";
    }

    @GetMapping("writeForm")
    public String writeForm() {
        return "board/writeForm";
    }

    @GetMapping("NoticeWriteForm")
    public String NoticeWriteForm() {
        return "board/NoticeWriteForm";
    }

    @GetMapping("qnawriteForm")
    public String qnawriteForm() {
        return "board/qnawriteForm";
    }

    @PostMapping("writeSave")
    public void writeSave(MultipartHttpServletRequest mul,
                          HttpServletResponse response,
                          HttpServletRequest request) throws IOException {
        String message = boardService.writeSave(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("NoticeWriteSave")
    public void NoticeWriteSave(HttpServletResponse response,
                                HttpServletRequest request) throws IOException {
        String message = boardService.NoticeWriteSave(request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("qnawriteSave")
    public void qnawriteSave(MultipartHttpServletRequest mul,
                             HttpServletResponse response,
                             HttpServletRequest request) throws IOException {
        String message = boardService.qnaWriteSave(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @GetMapping("contentView")
    public String contentView(@RequestParam int product_no, Model model) {
        boardService.contentView(product_no, model);
        return "board/contentView";
    }

    @GetMapping("NoticeView")
    public String NoticeView(@RequestParam int product_no, Model model) {
        boardService.NoticeView(product_no, model);
        return "board/NoticeView";
    }

    @GetMapping("qnaContentView")
    public String qnaContentView(BoardDTO dto, @RequestParam int product_no, Model model) {
        boardService.qnaContentView(product_no, model);

        List<QnaReplyDTO> replyList = boardService.readReply(dto.getProduct_no());
        model.addAttribute("replyList", replyList);
        return "board/qnaContentView";
    }

    @PostMapping("reply")
    public void reply(HttpServletResponse response,
                      HttpServletRequest request) throws IOException {
        String message = boardService.reply(request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @GetMapping("download")
    public void download(@RequestParam("file") String fileName, HttpServletResponse response) throws Exception {
        response.addHeader("content-disposition", "attachment;fileName=" + fileName);
        File file = new File(BoardFileService.IMAGE_REPO + "\\" + fileName);
        FileInputStream in = new FileInputStream(file);
        FileCopyUtils.copy(in, response.getOutputStream());
        in.close();
    }

    @GetMapping("modifyForm")
    public String modifyForm(@RequestParam int product_no, Model model) {
        boardService.contentView(product_no, model);
        return "board/modifyForm";
    }

    @GetMapping("NoticeModifyForm")
    public String NoticeModifyForm(@RequestParam int product_no, Model model) {
        boardService.NoticeView(product_no, model);
        return "board/NoticeModifyForm";
    }

    @GetMapping("qnaModifyForm")
    public String qnaModifyForm(@RequestParam int product_no, Model model) {
        boardService.qnaContentView(product_no, model);
        return "board/qnaModifyForm";
    }


    @PostMapping("modify")
    public void modify(MultipartHttpServletRequest mul,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        String message = boardService.modify(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("NoticeModify")
    public void NoticeModify(HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        String message = boardService.NoticeModify(request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("qnaModify")
    public void qnamodify(MultipartHttpServletRequest mul,
                          HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        String message = boardService.qnaModify(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @GetMapping("delete")
    public void delete(@RequestParam int product_no,
                       @RequestParam String product_img,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        String message = boardService.boardDelete(product_no, product_img, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }

    @GetMapping("Noticedelete")
    public void Noticedelete(@RequestParam int product_no,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        String message = boardService.NoticeDelete(product_no, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }

    @GetMapping("qnadelete")
    public void qnadelete(@RequestParam int product_no,
                          @RequestParam String product_img,
                          HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        String message = boardService.qnaBoardDelete(product_no, product_img, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }


}
