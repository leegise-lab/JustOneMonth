package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberShDTO {
    private int mem_idx;
    private String mem_userid;
    private String mem_pass;
    private String mem_name;
    private String mem_birth;
    private String mem_gender;
    private String mem_email;
    private String mem_hp;
    private String mem_zipcode;
    private String mem_address1;
    private String mem_address2;
    private String mem_regdate;
}
