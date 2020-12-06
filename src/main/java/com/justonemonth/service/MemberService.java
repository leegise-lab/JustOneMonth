package com.justonemonth.service;

import com.justonemonth.model.MemberDAO;
import com.justonemonth.model.MemberDTO;
import com.justonemonth.model.SetMemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    public MemberDAO mapper;

    // 로그인
    public String login(MemberDTO memberDTO) {
        return mapper.login(memberDTO);
    }

    // 로그인 체크
    public String loginCheck(MemberDTO memberDTO) {
        return mapper.loginCheck(memberDTO);
    }

    // 아이디 중복 체크
//    public int idChk(MemberDTO memberDTO) throws Exception {
////        int result = mapper.idChk(memberDTO);
//        return result;
//    }


//    로그아웃
//    public void logout(HttpServletResponse response) throws Exception {
//        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out = response.getWriter();
//        out.println("<script>");
//        out.println("location.href=document.referrer;");
//        out.println("</script>");
//        out.close();
//    }

    // 회원가입
    public int join(MemberDTO memberDTO) {
        return mapper.join(memberDTO);
    }

    //        회원삭제
    public int memDelete(MemberDTO memberDTO) {
        return mapper.memDelete(memberDTO);
    }

    // 회원 수정
    public int memUpdate(MemberDTO memberDTO) {
        return mapper.memUpdate(memberDTO);
    }

    // 회원 뷰
    public List<SetMemberInfo> viewModify(String memUserid) {
        return mapper.viewModify(memUserid);
    }


}
