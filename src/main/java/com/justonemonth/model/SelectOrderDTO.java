package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class SelectOrderDTO {
    private String productName, price, payFinish, orderNum, deliveryFinish;
    private Date date;
}
