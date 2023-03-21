package com.bit.member.dto;

//create table membership1(
//name varchar2(20),
//id varchar2(20) primary key, 
//pw varchar2(100),
//email varchar2(100),
//nickname varchar2(10)
//type varchar2(10)
//);

import lombok.Data;

@Data
public class MemberDTO {


    private String name;
    private String id;
    private String pw;
    private String email;
    private String nickname;
    private String type;
    private String role;


}
