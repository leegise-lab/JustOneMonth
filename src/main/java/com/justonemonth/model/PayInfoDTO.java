package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PayInfoDTO {
    private String id, name, mail, payType, payProduct, price, payFinish, orderHp, orderAddress,orderNum,deliveryNum;
}
