package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class SelectOrderDetailDTO {
    private String orderNum, orderName, payFinish, deliveryNum, hp, address, payType, price;
    private Date date;
}
