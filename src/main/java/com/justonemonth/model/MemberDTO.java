package com.justonemonth.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
    private String memUserid;
    private String memPass;
    private String memName;
    private String memBirth;
    private String memGender;
    private String memEmail;
    private String memHp;
    private String memZipcode;
    private String memAddress1;
    private String memAddress2;
    private String mem_regdate;

    public MemberDTO(String memUserid, String memPass, String memName, String memBirth, String memGender, String memEmail, String memHp, String memZipcode, String memAddress1, String memAddress2) {
        this.memUserid = memUserid;
        this.memPass = memPass;
        this.memName = memName;
        this.memBirth = memBirth;
        this.memGender = memGender;
        this.memEmail = memEmail;
        this.memHp = memHp;
        this.memZipcode = memZipcode;
        this.memAddress1 = memAddress1;
        this.memAddress2 = memAddress2;
    }

    public MemberDTO(String memUserid, String memPass) {
        this.memUserid = memUserid;
        this.memPass = memPass;
    }

    public MemberDTO(String memUserid, String memPass, String memName, String memEmail, String memHp, String memAddress1, String memAddress2) {
        this.memUserid = memUserid;
        this.memPass = memPass;
        this.memName = memName;
        this.memEmail = memEmail;
        this.memHp = memHp;
        this.memAddress1 = memAddress1;
        this.memAddress2 = memAddress2;
    }
}
