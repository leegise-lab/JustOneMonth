package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class InsertPayInfoDTO {
    private String deliveryNum, orderNum, orderId, orderName, orderMail, orderHp, orderAddress, payType,
            payPrice, productName, payFinish;
}
