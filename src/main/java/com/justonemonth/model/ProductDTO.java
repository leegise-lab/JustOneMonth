package com.justonemonth.model;

import lombok.Data;

@Data
public class ProductDTO {
    private int idx;
    private int amount;
    private int price;
    private String productName;
    private String color;
    private String size;
    private String userid;

}

