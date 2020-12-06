package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class SetMemberInfo {
    private String memUserid;
    private String memName;
    private String memPass;
    private String memZipcode;
    private String memAddress1;
    private String memAddress2;
    private String memEmail;
    private String memHp;
}