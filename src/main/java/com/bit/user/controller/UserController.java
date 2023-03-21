package com.bit.user.controller;

import com.bit.HomeController;
import com.bit.user.dto.UserDTO;
import com.bit.user.service.UserService;
import com.bit.session.name.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController implements UserSession {

    @Autowired
    private UserService userService;

    @Autowired
    private HomeController homeController;

    @GetMapping("login")
    public String login() {
        return "user/login";
    }

    @RequestMapping("successLogin")
    public String successLogin(@RequestParam("id") String id, HttpSession session) {
        session.setAttribute(LOGIN, id);
        return "user/successLogin";
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        if (session.getAttribute("loginUser") != null) {
            session.invalidate();
        }
        return "redirect:/index";
    }

    @RequestMapping("/myPage")
    public String myPage(Model model, @RequestParam("id") String userid) {
        userService.myPage(model, userid);
        return "user/myPage";
    }

    @RequestMapping("/info")
    public String info(Model model, @RequestParam("id") String userid) {
        userService.info(model, userid);
        return "user/userInfo";
    }

    @RequestMapping("/info_a")
    public String info_a(Model model, @RequestParam("id") String userid) {
        userService.info(model, userid);
        return "user/userInfo_a";
    }


    @RequestMapping("/infoUpdate")
    public void infoUpdate(UserDTO user,
                           HttpServletRequest request,
                           HttpServletResponse response) throws Exception {
        String message = userService.infoUpdate(user, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @RequestMapping("/infoUpdate_a")
    public void infoUpdate_a(UserDTO user,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        String message = userService.infoUpdate_a(user, request);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    @RequestMapping("/register_form")
    public ModelAndView register_form() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/register");
        return mv;
    }

    @RequestMapping("/idCheck")
    @ResponseBody
    public String register(@RequestParam("id") String id) throws IOException {
        String result = userService.idCheck(id);
        return result;
    }

    @RequestMapping("/register")
    public ModelAndView register(UserDTO user) throws IOException {
        ModelAndView mv = new ModelAndView();
        int result = userService.register(user);
        mv.setViewName("/user/successRegister");
        return mv;
    }


    @RequestMapping("/loginTest")
    public ModelAndView loginTest(UserDTO user, HttpServletResponse res, HttpServletRequest request, HttpSession session) throws IOException {
        ModelAndView mv = new ModelAndView();
        session = request.getSession();
        int result = userService.loginTest(user);
        if (result != 1) {
            res.setContentType("text/html; charset=euc-kr");
            PrintWriter out = res.getWriter();
            out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); </script>");
            out.flush();
            mv.setViewName("/user/login");
            return mv;
        } else {
            if (request.getParameter("id").equals("admin")) {
                session.setAttribute(ADMIN_LOGIN, user.getId());
                mv.addObject("session", session);
                mv.addObject("result", result);
                mv.setViewName("redirect:/index");
                return mv;
            } else {
                session.setAttribute(LOGIN, user.getId());
                mv.addObject("session", session);
                mv.addObject("result", result);
                mv.setViewName("redirect:/index");
                return mv;
            }
        }
    }

    @RequestMapping("/logoutTest")
    public ModelAndView logoutTest(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        session = request.getSession();
        session.invalidate();
        mv.setViewName("redirect:/index");
        return mv;
    }

    @RequestMapping("/userDelete")
    public void userDelete(@RequestParam("id") String id,
                           UserDTO user,
                           HttpServletRequest request,
                           HttpServletResponse response,
                           HttpSession session) throws Exception {
        String message = userService.userDelete(id, user, request, session);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }

    // 01 회원 목록
    @RequestMapping("/userList")
    public String userList(Model model) {
        List<UserDTO> list = userService.userList();
        model.addAttribute("list", list);
        return "user/userList";
    }

}