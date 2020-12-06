package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SetCartInfoDTO {
    private String cartAmount, cartProductPrice, cartProductName, cartImg, cartOrderNum, cartColor, cartSize, cartUserId;
}