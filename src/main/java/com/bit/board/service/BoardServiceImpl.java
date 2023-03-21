package com.bit.board.service;

import com.bit.board.dto.BoardDTO;
import com.bit.board.dto.QnaReplyDTO;
import com.bit.mybatis.board.BoardMapper;
import com.bit.mybatis.board.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardMapper boardMapper;

    @Autowired
    BoardFileService boardFileService;
    @Autowired
    ReplyMapper replyMapper;

    @Override
    public void boardAllList(Model model, int num) {
        int pageLetter = 8; // 한 페이지당 글목록 수
        int allCount1 = boardMapper.selectBoardCount(); // 전체 글 수

        int repeat = allCount1 / pageLetter; // 마지막 페이지 번호
        if (allCount1 % pageLetter != 0) {
            repeat += 1;
        }
        int end = num * pageLetter;
        int start = end + 1 - pageLetter;

        model.addAttribute("repeat", repeat);
        model.addAttribute("boardList", boardMapper.boardAllList(start, end));
    }

    @Override
    public void Notice(Model model, int num) {
        int pageLetter = 8; // 한 페이지당 글목록 수
        int allCount1 = boardMapper.selectBoardCount(); // 전체 글 수

        int repeat = allCount1 / pageLetter; // 마지막 페이지 번호
        if (allCount1 % pageLetter != 0) {
            repeat += 1;
        }
        int end = num * pageLetter;
        int start = end + 1 - pageLetter;

        model.addAttribute("repeat", repeat);
        model.addAttribute("NoticeList", boardMapper.NoticeList(start, end));
    }

    @Override
    public List<BoardDTO> BlistAll(String searchOption, String keyword) {
        // 검색옵션, 키워드 맵에 저장
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        return boardMapper.BlistAll(map);
    }

    @Override
    public int BcountArticle(String searchOption, String keyword) {
        // 검색옵션, 키워드 맵에 저장
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        return boardMapper.BcountArticle(map);
    }

    @Override
    public List<BoardDTO> QlistAll(String searchOption, String keyword) {
        // 검색옵션, 키워드 맵에 저장
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        return boardMapper.QlistAll(map);
    }

    @Override
    public int QcountArticle(String searchOption, String keyword) {
        // 검색옵션, 키워드 맵에 저장
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        return boardMapper.QcountArticle(map);
    }

    @Override
    public void mypageList(Model model, int num, String id) {
        int pageLetter = 8; // 한 페이지당 글목록 수
        int allCount2 = boardMapper.myselectBoardCount(id); // 전체 글 수

        int repeat = allCount2 / pageLetter; // 마지막 페이지 번호
        if (allCount2 % pageLetter != 0) {
            repeat += 1;
        }
        int end = num * pageLetter;
        int start = end + 1 - pageLetter;

        model.addAttribute("repeat", repeat);
        model.addAttribute("mypageList", boardMapper.mypageList(start, end, id));
    }

    @Override
    public void qnamypageList(Model model, int num, String id) {
        int pageLetter = 8; // 한 페이지당 글목록 수
        int allCount2 = boardMapper.qnamyselectBoardCount(id); // 전체 글 수

        int repeat = allCount2 / pageLetter; // 마지막 페이지 번호
        if (allCount2 % pageLetter != 0) {
            repeat += 1;
        }
        int end = num * pageLetter;
        int start = end + 1 - pageLetter;

        model.addAttribute("repeat", repeat);
        model.addAttribute("qnamypageList", boardMapper.qnamypageList(start, end, id));
    }

    @Override
    public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();

        dto.setProduct_writer(mul.getParameter("product_writer"));
        dto.setProduct_title(mul.getParameter("product_title"));
        dto.setProduct_main(mul.getParameter("product_main"));
        dto.setProduct_type(mul.getParameter("product_type"));
        dto.setProduct_price((Integer.parseInt(mul.getParameter("product_price"))));
        dto.setProduct_trade(mul.getParameter("product_trade"));
        dto.setProduct_status(mul.getParameter("product_status"));
        dto.setProduct_status1(mul.getParameter("product_status1"));
        MultipartFile file = mul.getFile("product_img");

//      데이터 가져오는지 테스트
//      String writer=mul.getParameter("product_writer");
//      String title=mul.getParameter("product_title");
//      String main=mul.getParameter("product_main");
//      String fileName=file.getOriginalFilename();
//      System.out.println(writer);
//      System.out.println(title);
//      System.out.println(main);
//      System.out.println(fileName);

        if (file.getSize() != 0) {   // 이미지 파일이 있을때
            System.out.println(boardFileService.saveFile(file));
            dto.setProduct_img(boardFileService.saveFile(file));
        } else {
            dto.setProduct_img("nan");
        }
        int result = 0;
        try {
            result = boardMapper.writeSave(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "글이 등록되었습니다";
            url = "/board/boardAllList";
        } else {
            msg = "문제가 발생했습니다";
            url = "/board/writeForm";
        }

        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String NoticeWriteSave(HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();
        dto.setProduct_writer(request.getParameter("product_writer"));
        dto.setProduct_title(request.getParameter("product_title"));
        dto.setProduct_main(request.getParameter("product_main"));
        dto.setProduct_type(request.getParameter("product_type"));
        int result = 0;
        try {
            result = boardMapper.NoticeWriteSave(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String msg, url;
        if (result == 1) {
            msg = "글이 등록되었습니다";
            url = "/board/Notice";
        } else {
            msg = "문제가 발생했습니다";
            url = "/board/NoticeWriteForm";
        }
        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String qnawriteSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();
        dto.setProduct_writer(mul.getParameter("product_writer"));
        dto.setProduct_title(mul.getParameter("product_title"));
        dto.setProduct_main(mul.getParameter("product_main"));
        dto.setProduct_type(mul.getParameter("product_type"));
        MultipartFile file = mul.getFile("product_img");

        if (file.getSize() != 0) {   // 이미지 파일이 있을때
            System.out.println(boardFileService.saveFile(file));
            dto.setProduct_img(boardFileService.saveFile(file));
        } else {
            dto.setProduct_img("nan");
        }
        int result = 0;
        try {
            result = boardMapper.qnawriteSave(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "글이 등록되었습니다";
            url = "/board/qna";
        } else {
            msg = "문제가 발생했습니다";
            url = "/board/qnawriteForm";
        }

        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public void contentView(int product_no, Model model) {
        model.addAttribute("data", boardMapper.contentView(product_no));
    }

    @Override
    public void NoticeView(int product_no, Model model) {
        model.addAttribute("data", boardMapper.NoticeView(product_no));
    }

    @Override
    public void qnacontentView(int product_no, Model model) {
        model.addAttribute("data", boardMapper.contentView(product_no));

    }

    @Override
    public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();
        dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
        dto.setProduct_title(mul.getParameter("product_title"));
        dto.setProduct_main(mul.getParameter("product_main"));
//      dto.setproduct_type(mul.getParameter("product_type"));
        dto.setProduct_price(Integer.parseInt(mul.getParameter("product_price")));
        dto.setProduct_trade(mul.getParameter("product_trade"));
        dto.setProduct_status(mul.getParameter("product_status"));
        dto.setProduct_status1(mul.getParameter("product_status1"));

        MultipartFile file = mul.getFile("product_img");
        if (file.getSize() != 0) {
            dto.setProduct_img(boardFileService.saveFile(file));
            boardFileService.deleteImage(mul.getParameter("originFileName"));
        } else {
            dto.setProduct_img(mul.getParameter("originFileName"));
        }
        int result = boardMapper.modify(dto);


        try {
            result = boardMapper.modify(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "내용이 변경되었습니다";
            url = "/board/contentView?product_no=" + dto.getProduct_no();
        } else {
            msg = "수정 오류";
            url = "/board/modifyForm?product_no=" + dto.getProduct_no();
        }
        return boardFileService.getMessage(request, msg, url);

    }

    @Override
    public String NoticeModify(HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();
        dto.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
        dto.setProduct_title(request.getParameter("product_title"));
        dto.setProduct_main(request.getParameter("product_main"));

        int result = 0;
        try {
            result = boardMapper.NoticeModify(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "내용이 변경되었습니다";
            url = "/board/Notice";
        } else {
            msg = "수정 오류";
            url = "/board/NoticeModifyForm?product_no=" + dto.getProduct_no();
        }
        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String qnamodify(MultipartHttpServletRequest mul, HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();
        dto.setProduct_no(Integer.parseInt(mul.getParameter("product_no")));
        dto.setProduct_title(mul.getParameter("product_title"));
        dto.setProduct_main(mul.getParameter("product_main"));

        MultipartFile file = mul.getFile("product_img");
        if (file.getSize() != 0) {
            dto.setProduct_img(boardFileService.saveFile(file));
            boardFileService.deleteImage(mul.getParameter("originFileName"));
        } else {
            dto.setProduct_img(mul.getParameter("originFileName"));
        }

        int result = 0;
        try {
            result = boardMapper.qnamodify(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "내용이 변경되었습니다";
            url = "/board/qna";
        } else {
            msg = "수정 오류";
            url = "/board/qnamodifyForm?product_no=" + dto.getProduct_no();
        }
        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String boardDelete(int product_no, String product_img, HttpServletRequest request) {
        // DB에서 글번호 해당하는 레코드 삭제

        // DB 처리 결과값으로 성공, 실패 결정
        // - 성공 : 해당 글번호 이미지 파일 삭제하고 글목록 이동
        //   실패 : 해당 글로 다시 이동
        int result = boardMapper.delete(product_no);

        String msg, url;
        if (result == 1) {
            msg = "삭제되었습니다";
            url = "/board/boardAllList";
            boardFileService.deleteImage(product_img);
        } else {
            msg = "삭제 오류";
            url = "/board/contentView?product_img=" + product_no;
        }
        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String Noticedelete(int product_no, HttpServletRequest request) {
        int result = boardMapper.delete(product_no);

        String msg, url;
        if (result == 1) {
            msg = "삭제되었습니다";
            url = "/board/Notice";
        } else {
            msg = "삭제 오류";
            url = "/board/Notice?product_no=" + product_no;
        }
        return boardFileService.getMessage(request, msg, url);
    }

    @Override
    public String qnaboardDelete(int product_no, String product_img, HttpServletRequest request) {
        int result = boardMapper.qnadelete(product_no);

        String msg, url;
        if (result == 1) {
            msg = "삭제되었습니다";
            url = "/board/qna";
            boardFileService.deleteImage(product_img);
        } else {
            msg = "삭제 오류";
            url = "/board/qnacontentView?product_img=" + product_no;
        }
        return boardFileService.getMessage(request, msg, url);
    }

/////////////////////////////////////////////////////////////////////

    @Override
    public void qna(Model model, int num) {
        int pageLetter = 8; // 한 페이지당 글목록 수
        int allCount3 = boardMapper.qnaselectBoardCount(); // 전체 글 수

        int repeat = allCount3 / pageLetter; // 마지막 페이지 번호
        if (allCount3 % pageLetter != 0) {
            repeat += 1;
        }
        int end = num * pageLetter;
        int start = end + 1 - pageLetter;

        model.addAttribute("repeat", repeat);
        model.addAttribute("qna", boardMapper.qna(start, end));
    }

    @Override
    public List<QnaReplyDTO> readReply(int bno) {
        return replyMapper.readReply(bno);
    }

    @Override
    public String reply(HttpServletRequest request) {
        QnaReplyDTO dto = new QnaReplyDTO();
        dto.setBno(Integer.parseInt(request.getParameter("product_no")));
        dto.setWriter(request.getParameter("writer"));
        dto.setContent(request.getParameter("content"));
        dto.setRegdate(request.getParameter("regdate"));
        int result = 0;
        try {
            result = replyMapper.reply(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String msg, url;
        if (result == 1) {
            msg = "글이 등록되었습니다";
            url = "/board/qnacontentView?product_no=" + request.getParameter("product_no");
        } else {
            msg = "문제가 발생했습니다";
            url = "/board/qnacontentView?product_no=" + request.getParameter("product_no");
        }

        return boardFileService.getMessage(request, msg, url);
    }


}