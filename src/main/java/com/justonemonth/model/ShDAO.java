package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface ShDAO {
    HashMap<String, String> selectMemberTotcnt(HashMap<String, String> dataMap);
    List<MemberShDTO> selectMemberWithPaging(HashMap<String, String> dataMap);
    void deleteMember(int mem_idx);

    HashMap<String, String> selectProductTotcnt(HashMap<String, String> dataMap);
    List<mainDTO> selectProductWithPaging(HashMap<String, String> dataMap);
    void deleteProduct(int mem_idx);
}
