package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderDTO {
    private String mem_userid, mem_name, mem_email, mem_hp, mem_zipcode, mem_address1, mem_address2;
}
