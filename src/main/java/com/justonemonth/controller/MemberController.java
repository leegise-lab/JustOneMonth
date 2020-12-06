package com.justonemonth.controller;

import com.justonemonth.model.MemberDTO;
import com.justonemonth.model.SetMemberInfo;
import com.justonemonth.model.TestDTO;
import com.justonemonth.service.MemberService;
import com.justonemonth.service.TestService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@RestController
public class MemberController {
    @Autowired
    MemberService memberService;


    // 회원 가입
    @RequestMapping(value = "/regist")
    public ModelAndView regist(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("regist_simple");
        String name = request.getParameter("name");
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("name",name);
        return mv;
    }

    // 회원 탈퇴 사유 적기
    @RequestMapping(value = "/memberOut")
    public ModelAndView memberOut(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("member_out");
        return mv;
    }

    @RequestMapping(value = "/memberOutOk")
    public ModelAndView memberOutOk(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("member_out_ok");
        String getPw = request.getParameter("memPass");
        HttpSession httpSession = request.getSession(); // 이미 있는 세션을 가지고 오겠다. 숨을 불어준다. 형상화
        String loginId = "" + httpSession.getAttribute("loginId");
        MemberDTO memberDTO = new MemberDTO(loginId, getPw);
        int result = memberService.memDelete(memberDTO);
        mv.addObject("result", result);
        httpSession.invalidate();
        return mv;

    }

    @RequestMapping(value = "/memberModify")
    public ModelAndView memberModify(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("regist_modify");

        // 숨 불어주기
        HttpSession httpSession = request.getSession();
        String loginId = "" + httpSession.getAttribute("loginId");
//        String loginId = "dlwlsdudslae";

        // MemberDTO로 넣어주기 //xml의 ParameterType에 맞춰준다.
        List<SetMemberInfo> setMemberInfos = memberService.viewModify(loginId);
        mv.addObject("loginInfos", setMemberInfos);

        return mv;
    }

//    @RequestMapping(value = "/idChk", method = RequestMethod.POST)
//    public int idChk(MemberDTO memberDTO) throws Exception {
//        int result = memberService.idChk(memberDTO);
//        return result;
//    }

    @RequestMapping(value = "/memberModifyOk")
    public ModelAndView memberModifyOk(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("regist_modify_ok");

        HttpSession httpSession = request.getSession();
        String id = "" + httpSession.getAttribute("loginId");

        String password = request.getParameter("password1");
        String email = request.getParameter("email");
        String hp = request.getParameter("hp");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String zipcode = request.getParameter("zipcode");

        MemberDTO memberDTO = new MemberDTO
                (id, password, email, hp, address1, address2, zipcode);

        memberService.memUpdate(memberDTO);
        return mv;
    }
}