package com.justonemonth.model;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@Mapper
public interface ReplyDAO {
    int inputReply(HashMap map);

    String replyWatch(int articleNo);

    int replyAnswer(int boardidx);
}
