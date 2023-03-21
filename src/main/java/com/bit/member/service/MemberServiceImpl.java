package com.bit.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bit.member.dto.MemberDTO;
import com.bit.mybatis.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int user_check(String id){
		String usercheck = memberMapper.user_check(id);
		//int usercheck =Integer.parseInt(mapper.user_check(id));
		int result = Integer.parseInt(usercheck);
		return result;
	}

	@Override
	public void mypage(Model model, String userid) {
		model.addAttribute("member", memberMapper.info(userid));
	}
	
	@Override
	public void info(Model model, String userid) {
		model.addAttribute("info", memberMapper.info(userid));
	}

	@Override
	public String infoUpdate(MemberDTO member, HttpServletRequest request) {
		int result=memberMapper.infoUpdate(member);
		String msg, url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/member/mypage?id="+member.getId();
		} else {
			msg="수정 오류";
			url="/member/memberinfo?id="+member.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}
	
	@Override
	public String infoUpdate_a(MemberDTO member, HttpServletRequest request) {
		int result=memberMapper.infoUpdate(member);
		String msg, url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/member/memberList";
		} else {
			msg="수정 오류";
			url="/member/memberinfo_a?id="+member.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}
	
	@Override
	public int register(MemberDTO member) {
		try {
			return memberMapper.register(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int logintest(MemberDTO member) {
		int result=memberMapper.logintest(member);
		return result;
	}


	public String memberDelete(String id, MemberDTO member, HttpServletRequest request, HttpSession session) {
		int result=memberMapper.memberDelete(id);
		String msg, url;
		if(result==1) {
			msg="탈퇴를 진행하시겠습니까?";
			session=request.getSession();
			session.invalidate();
			url="/index";
		} else {
			msg="탈퇴 오류";
			url="/member/mypage?id="+member.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}

	@Override
	public String idcheck(String id) {
		String result=memberMapper.idcheck(id);
		return result;
	}

	@Override
	public List<MemberDTO> memberList() {
		return memberMapper.memberList();
	}

	

	
}
