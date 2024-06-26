package com.bit.handler;

import com.bit.user.dto.UserCustomDetails;
import com.bit.user.dto.UserDTO;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class UserAuthSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        UserDTO userDTO = ((UserCustomDetails) authentication.getPrincipal()).getUserDTO();
        userDTO.setPw(null);
        HttpSession session = httpServletRequest.getSession();
        session.setAttribute("logIn", userDTO);

        httpServletResponse.sendRedirect("/");
    }
}















