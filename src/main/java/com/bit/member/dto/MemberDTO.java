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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


}
