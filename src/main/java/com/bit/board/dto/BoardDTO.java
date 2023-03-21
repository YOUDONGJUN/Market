package com.bit.board.dto;

//create table board_product(
//product_title varchar(30),
//product_day date default sysdate,
//product_view number(38) default 0,
//product_main varchar2(300),
//product_img varchar(40),
//product_wait varchar(40),
//product_soldout varchar(40),
//product_writer varchar2(20),
//constraint fk foreign key(product_writer) references membership1(id) on delete cascade
//);

import lombok.Data;

@Data
public class BoardDTO {

    private int product_no;
    private String product_title;
    private String product_day;
    private String product_main;
    private String product_img;
    private String product_writer;
    private String product_type;
    private String product_trade;
    private String product_status;
    private int product_price;

}
