package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyDTO {
//    private int autoReIdx;
//    private int reIdx;
    private int replyNo;
    private int articleNo;
    private String reContent;
    private Date regDate;
}
