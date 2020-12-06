package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class SetOrderListDTO {
    private Date date;
    private String orderId, productName, price, deliveryFinish, payFinish, orderNum;
}