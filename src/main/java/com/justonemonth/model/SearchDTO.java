package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class SearchDTO {
    private String search, searchCategory, startDate, endDate, delivery, start, pagePerCnt, pageNum;
}