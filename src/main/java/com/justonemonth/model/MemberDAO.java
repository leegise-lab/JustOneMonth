package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
@Mapper
public interface MemberDAO {
    //xml resultType, ParameterType 과 일치 시켜준다.

    // 로그인
    //ResultType login(Parameter Type)
    String login(MemberDTO memberDTO);

    // 로그인 확인
    String loginCheck(MemberDTO memberDTO);

    // 회원 로그인 정보
    MemberDTO viewMember(MemberDTO dto);

    // 회원 가입
    int join(MemberDTO memberDTO);

    // 로그아웃
    public void logout(HttpSession session);

    // 회원 삭제
    int memDelete(MemberDTO memberDTO);

    // 회원 수정
    int memUpdate(MemberDTO memberDTO);

    // 회원 뷰
    List<SetMemberInfo> viewModify(String memUserid);

}
