package com.justonemonth.service;

import com.justonemonth.model.ReplyDAO;
import com.justonemonth.model.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class ReplyService {
    @Autowired
    public ReplyDAO mapper;

    public int inputReply(HashMap map){
        return mapper.inputReply(map);
    }

    public String replyWatch(int articleNo) { return  mapper.replyWatch(articleNo); }

    public int replyAnswer(int boardidx) { return mapper.replyAnswer(boardidx); }
}
