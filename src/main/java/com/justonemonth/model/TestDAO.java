package com.justonemonth.model;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface TestDAO {

    List<mainDTO> selectItems(int i );
    List<mainDTO> selectItem(int i,int i1);
    List<mainDTO> selectItemAll();
    List<mainDTO> itemview(int up_idx);
    List<mainDTO> review(int up_idx);
    List<mainDTO> selectItemAllsh(HashMap<String, String> dataMap);
    //준호씨
    int cartInsert(HashMap dataMap);
    List<CartDTO> cartShow(String userid);
    int deleteItem(int i);
    int cartUpdate(HashMap dataMap);

}
