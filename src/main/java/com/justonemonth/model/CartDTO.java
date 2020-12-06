package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartDTO {
    private int cart_idx;
    private String cart_userid;
    private int cart_amount;
    private int cart_productprice;
    private String cart_productname;
    private String cart_ordernum;
    private String cart_productimg;
    private String cart_color;
    private String cart_size;

    public CartDTO(int cart_idx, String cart_userid, int cart_amount, int cart_productprice, String cart_productname, String cart_productimg, String cart_color, String cart_size) {
        this.cart_idx = cart_idx;
        this.cart_userid = cart_userid;
        this.cart_amount = cart_amount;
        this.cart_productprice = cart_productprice;
        this.cart_productname = cart_productname;
        this.cart_productimg = cart_productimg;
        this.cart_color = cart_color;
        this.cart_size = cart_size;
    }

}
