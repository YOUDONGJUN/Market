package com.bit.member.service;

import com.bit.member.dto.MemberDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface MemberService {

    public int user_check(String id);

    public void mypage(Model model, String userid);

    public void info(Model model, String userid);

    public String infoUpdate(MemberDTO member, HttpServletRequest request);

    public String infoUpdate_a(MemberDTO member, HttpServletRequest request);

    public int register(MemberDTO member);

    public int logintest(MemberDTO member);

    public String memberDelete(String id, MemberDTO member, HttpServletRequest request, HttpSession session);

    public String idcheck(String id);

    public List<MemberDTO> memberList();


}
