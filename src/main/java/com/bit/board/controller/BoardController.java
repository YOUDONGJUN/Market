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

    @Qualifier("boardService")
    @Autowired
    BoardService bs;

    @GetMapping("boardAllList")
    public String boardAllList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
        bs.boardAllList(model, num);
        return "board/boardAllList";
    }

    // 01. 게시글 목록
    @RequestMapping("boardList.do")
    // @RequestParam(defaultValue="") ==> 기본값 할당
    public ModelAndView boardList(@RequestParam(defaultValue = "product_title") String searchOption,
                                  @RequestParam(defaultValue = "") String keyword) throws Exception {
        List<BoardDTO> list = bs.BlistAll(searchOption, keyword);
        // 레코드의 갯수
        int count = bs.BcountArticle(searchOption, keyword);
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
        List<BoardDTO> list = bs.QlistAll(searchOption, keyword);
        // 레코드의 갯수
        int count = bs.QcountArticle(searchOption, keyword);
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
        bs.qna(model, num);
        return "board/qna";
    }

    @GetMapping("mypageList")
    public String mypageList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num, @RequestParam("id") String id) {
        bs.mypageList(model, num, id);
        return "board/mypageList";
    }

    @GetMapping("qnamypageList")
    public String qnamypageList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num, @RequestParam("id") String id) {
        bs.qnamypageList(model, num, id);
        return "board/qnamypageList";
    }

    @GetMapping("Notice")
    public String Notice(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) {
        bs.Notice(model, num);
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
        String message = bs.writeSave(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("NoticeWriteSave")
    public void NoticeWriteSave(HttpServletResponse response,
                                HttpServletRequest request) throws IOException {
        String message = bs.NoticeWriteSave(request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("qnawriteSave")
    public void qnawriteSave(MultipartHttpServletRequest mul,
                             HttpServletResponse response,
                             HttpServletRequest request) throws IOException {
        String message = bs.qnawriteSave(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @GetMapping("contentView")
    public String contentView(@RequestParam int product_no, Model model) {
        bs.contentView(product_no, model);
        return "board/contentView";
    }

    @GetMapping("NoticeView")
    public String NoticeView(@RequestParam int product_no, Model model) {
        bs.NoticeView(product_no, model);
        return "board/NoticeView";
    }

    @GetMapping("qnacontentView")
    public String qnacontentView(BoardDTO dto, @RequestParam int product_no, Model model) {
        bs.qnacontentView(product_no, model);

        List<QnaReplyDTO> replyList = bs.readReply(dto.getProduct_no());
        model.addAttribute("replyList", replyList);
        return "board/qnacontentView";
    }

    @PostMapping("reply")
    public void reply(HttpServletResponse response,
                      HttpServletRequest request) throws IOException {
        String message = bs.reply(request);
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
        bs.contentView(product_no, model);
        return "board/modifyForm";
    }

    @GetMapping("NoticeModifyForm")
    public String NoticeModifyForm(@RequestParam int product_no, Model model) {
        bs.NoticeView(product_no, model);
        return "board/NoticeModifyForm";
    }

    @GetMapping("qnamodifyform")
    public String qnamodifyForm(@RequestParam int product_no, Model model) {
        bs.qnacontentView(product_no, model);
        return "board/qnamodifyform";
    }


    @PostMapping("modify")
    public void modify(MultipartHttpServletRequest mul,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        String message = bs.modify(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("NoticeModify")
    public void NoticeModify(HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        String message = bs.NoticeModify(request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @PostMapping("qnamodify")
    public void qnamodify(MultipartHttpServletRequest mul,
                          HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        String message = bs.qnamodify(mul, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @GetMapping("delete")
    public void delete(@RequestParam int product_no,
                       @RequestParam String product_img,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        String message = bs.boardDelete(product_no, product_img, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }

    @GetMapping("Noticedelete")
    public void Noticedelete(@RequestParam int product_no,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        String message = bs.Noticedelete(product_no, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }

    @GetMapping("qnadelete")
    public void qnadelete(@RequestParam int product_no,
                          @RequestParam String product_img,
                          HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        String message = bs.qnaboardDelete(product_no, product_img, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);

    }


}
