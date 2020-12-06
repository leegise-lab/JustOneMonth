package com.justonemonth.service;


import com.justonemonth.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class ShService {
    @Autowired
    public ShDAO mapper;


    public List<MemberShDTO> selectMemberWithPaging(HashMap<String, String> dataMap) {
        return mapper.selectMemberWithPaging(dataMap);
    }
    public HashMap<String, String> selectMemberTotcnt(HashMap<String, String> dataMap) {
        return mapper.selectMemberTotcnt(dataMap);
    }

    public void deleteMember(String[] mem_idx_list) {
        for(int i=0; i<mem_idx_list.length; i++) {
            if(mem_idx_list[i] != "") {
                int idx = Integer.parseInt(mem_idx_list[i]);
                mapper.deleteMember(idx);
            }
        }
    }




    public List<mainDTO> selectProductWithPaging(HashMap<String, String> dataMap) {
        return mapper.selectProductWithPaging(dataMap);
    }
    public HashMap<String, String> selectProductTotcnt(HashMap<String, String> dataMap) {
        return mapper.selectProductTotcnt(dataMap);
    }
    public void deleteProduct(String[] mem_idx_list) {
        for(int i=0; i<mem_idx_list.length; i++) {
            if(mem_idx_list[i] != "") {
                int idx = Integer.parseInt(mem_idx_list[i]);
                mapper.deleteProduct(idx);
            }
        }
    }
}