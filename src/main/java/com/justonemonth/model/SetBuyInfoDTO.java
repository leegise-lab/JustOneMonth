package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SetBuyInfoDTO {
    private String cartAmount, cartProductPrice, cartProductName, cartImg, cartColor, cartSize, cartOrderNum;

}