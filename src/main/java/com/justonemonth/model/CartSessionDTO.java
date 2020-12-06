package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartSessionDTO {
    private String cartAmount, cartProductPrice, cartProductName, cartColor, cartSize, cartUserId, cartImg;
}
