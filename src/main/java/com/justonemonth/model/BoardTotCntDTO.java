package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardTotCntDTO {
    private int idx;
    private String category, title;
    private Date created_at;
    private String answer_yn;
}
