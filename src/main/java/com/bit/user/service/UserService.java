package com.bit.user.service;

import com.bit.user.dto.UserDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {

    public int user_check(String id);

    public void myPage(Model model, String userid);

    public void info(Model model, String userid);

    public String infoUpdate(UserDTO user, HttpServletRequest request);

    public String infoUpdate_a(UserDTO user, HttpServletRequest request);

    public int register(UserDTO user);

    public int loginTest(UserDTO user);

    public String userDelete(String id, UserDTO user, HttpServletRequest request, HttpSession session);

    public String idCheck(String id);

    public List<UserDTO> userList();


}
