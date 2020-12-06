package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
@Repository
@Mapper
public interface BoardDAO {
    List<BoardTotCntDTO> boardList(HashMap map);
    List<BoardDTO> boardNotice();
    String boardText(String title);
    int inputBoard(HashMap map);
    int boardTotalCount(String userid);
    BoardWatchDTO boardWatch(int idx);
    String replyText(int idx);
    List<BoardTotCntDTO> boardListADMIN(HashMap map);
    int boardTotalCountADMIN();

}