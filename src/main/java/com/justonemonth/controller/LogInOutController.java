package com.justonemonth.controller;

import com.justonemonth.model.MemberDTO;
import com.justonemonth.model.SetMemberInfo;
import com.justonemonth.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class LogInOutController {
    @Autowired
    MemberService memberService;

    // 회원 가입 후 -> login 페이지로 이동 (regist_simple - form태그 = action 값을 받는다.)

    // 로그인
    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("login");
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();
        String id = request.getParameter("id");

        if (id != null) {
            String password = request.getParameter("password1");
            String name = request.getParameter("name");
            String birth = request.getParameter("birth");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String hp = request.getParameter("hp");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String zipcode = request.getParameter("zipcode");


            //MemberDTO 순서 맞춰서
            MemberDTO memberDTO = new MemberDTO
                    (id, password, name, birth, gender, email, hp,zipcode, address1, address2);
            memberService.join(memberDTO);
        }


        return mv;
    }

    // 로그인 Check -
    @RequestMapping(value = "/loginCheck")
    public ModelAndView loginCheck(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("loginCheck");
        // login.jsp에서 입력한 값 넣어주기 (name=)
        String getId = request.getParameter("id");
        String getPw = request.getParameter("password");

        // MemberDTO로 넣어주기 //xml의 ParameterType에 맞춰준다.
        MemberDTO memberDTO = new MemberDTO(getId, getPw);

        // MemberDTO에서 받아서 넣어주기 //DTO타입으로 받고 String으로 보내준다.
        String user = memberService.login(memberDTO);

        // null 값이면?
        // null 값이 아니면 -> loginCheck에서 처리
        if (user == null) {
            System.out.println("로그인 실패");
        } else if (user != null || user.equals("")) {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("loginId", user);
            mv.addObject("login",getId);

        }
        return mv;
    }
    @RequestMapping(value = "/logOut")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("logOut");

        return mv;
    }
}