package com.justonemonth.service;

import com.justonemonth.model.CartDTO;
import com.justonemonth.model.TestDAO;
import com.justonemonth.model.TestDTO;


import com.justonemonth.model.mainDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class TestService {
    mainDTO dt ;


    @Autowired
    private SqlSession sqlsession;
    @Autowired
    public TestDAO mapper;



    public List<mainDTO> selectItems(int i) {

        return mapper.selectItems(i);
    }
    public List<mainDTO> selectItemAll() {

        return mapper.selectItemAll();
    }

    public int itemjoin(HashMap<String, String> dataMap) {
        return sqlsession.insert("com.justonemonth.model.TestDAO.itemjoin", dataMap);
    }
    public int rejoin(HashMap<String, String> dataMap) {
        return sqlsession.insert("com.justonemonth.model.TestDAO.reviewjoin", dataMap);
    }

    public List<mainDTO> selectItem(int i, int i1) {

        return mapper.selectItem(i,i1);
    }
    public List<mainDTO> itemview(int up_idx) {

        return mapper.itemview(up_idx);
    }
    public List<mainDTO> review(int up_idx) {

        return mapper.review(up_idx);
    }

    // 정후ㅈㅎ
    public List<mainDTO> selectItemAllsh(HashMap<String, String> dataMap) {
        return mapper.selectItemAllsh(dataMap);
    }

    //준호씨
    public int join(HashMap dataMap ) {
        return mapper.cartInsert(dataMap);
    }

    public List<CartDTO> cartshow1(String userid){

        return mapper.cartShow(userid);
    }

    public int deleteItem(int i){
        return mapper.deleteItem(i);
    }
    public int cartUpdate(HashMap dataMap) {
        return mapper.cartUpdate(dataMap);
    }

}




