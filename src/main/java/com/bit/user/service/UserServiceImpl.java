package com.bit.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bit.user.dto.UserDTO;
import com.bit.mybatis.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int userCheck(String id){
		String userCheck = userMapper.userCheck(id);
		//int userCheck =Integer.parseInt(mapper.user_check(id));
		int result = Integer.parseInt(userCheck);
		return result;
	}

	@Override
	public void myPage(Model model, String userid) {
		model.addAttribute("user", userMapper.info(userid));
	}
	
	@Override
	public void info(Model model, String userid) {
		model.addAttribute("info", userMapper.info(userid));
	}

	@Override
	public String infoUpdate(UserDTO user, HttpServletRequest request) {
		int result=userMapper.infoUpdate(user);
		String msg, url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/user/myPage?id="+user.getId();
		} else {
			msg="수정 오류";
			url="/user/userInfo?id="+user.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}
	
	@Override
	public String infoUpdate_a(UserDTO user, HttpServletRequest request) {
		int result=userMapper.infoUpdate(user);
		String msg, url;
		if(result==1) {
			msg="내용이 변경되었습니다";
			url="/user/userList";
		} else {
			msg="수정 오류";
			url="/user/userInfo_a?id="+user.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}
	
	@Override
	public int register(UserDTO user) {
		try {
			return userMapper.register(user);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int loginTest(UserDTO user) {
		int result=userMapper.loginTest(user);
		return result;
	}


	public String userDelete(String id, UserDTO user, HttpServletRequest request, HttpSession session) {
		int result=userMapper.userDelete(id);
		String msg, url;
		if(result==1) {
			msg="탈퇴를 진행하시겠습니까?";
			session=request.getSession();
			session.invalidate();
			url="/index";
		} else {
			msg="탈퇴 오류";
			url="/user/myPage?id="+user.getId();
		}
		String message=null;
		String path=request.getContextPath();
		message="<script>alert('"+msg+"');";
		message+="location.href='"+path+url+"';</script>";
		return message;
	}

	@Override
	public String idCheck(String id) {
		String result=userMapper.idCheck(id);
		return result;
	}

	@Override
	public List<UserDTO> userList() {
		return userMapper.userList();
	}

	

	
}
