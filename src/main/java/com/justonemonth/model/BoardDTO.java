package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
    private int idx;
    private String userId;
    private String category;
    private String userEmail;
    private String title;
    private String content;
    private String hp;
    private Date created_at;
    private String answer_yn;
    private String fileName;
    private String filePath;
}
