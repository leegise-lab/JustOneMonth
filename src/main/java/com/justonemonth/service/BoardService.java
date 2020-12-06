package com.justonemonth.service;

import com.justonemonth.model.BoardDAO;
import com.justonemonth.model.BoardDTO;
import com.justonemonth.model.BoardTotCntDTO;
import com.justonemonth.model.BoardWatchDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BoardService {

    private static SqlSession sqlSession;

    @Autowired
    public BoardDAO mapper;

    public List<BoardTotCntDTO> boardList(HashMap map) {
        return mapper.boardList(map);
    }

    public List<BoardDTO> boardNotice() { return mapper.boardNotice(); }

    public String boardText(String title){
        return mapper.boardText(title);
    }

    public int boardTotalCount(String userid) { return mapper.boardTotalCount(userid); }

    public BoardWatchDTO boardWatch(int idx) { return mapper.boardWatch(idx); }

    public int inputBoard(HashMap map){
        return mapper.inputBoard(map);
    }
    // INT : DB 받는애 타입

    public List<BoardTotCntDTO> boardListADMIN(HashMap map) {
        return mapper.boardListADMIN(map);
    }
    public int boardTotalCountADMIN() { return mapper.boardTotalCountADMIN(); }

}