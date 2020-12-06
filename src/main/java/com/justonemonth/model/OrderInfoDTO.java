package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderInfoDTO {
    private String name, mail, post_code, address, hp, payType, productName, price;
}
