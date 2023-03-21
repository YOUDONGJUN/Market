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
    private String product_status1;

    public int getProduct_no() {
        return product_no;
    }

    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }

    public String getProduct_title() {
        return product_title;
    }

    public void setProduct_title(String product_title) {
        this.product_title = product_title;
    }

    public String getProduct_day() {
        return product_day;
    }

    public void setProduct_day(String product_day) {
        this.product_day = product_day;
    }

    public String getProduct_main() {
        return product_main;
    }

    public void setProduct_main(String product_main) {
        this.product_main = product_main;
    }

    public String getProduct_img() {
        return product_img;
    }

    public void setProduct_img(String product_img) {
        this.product_img = product_img;
    }

    public String getProduct_writer() {
        return product_writer;
    }

    public void setProduct_writer(String product_writer) {
        this.product_writer = product_writer;
    }

    public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public String getProduct_trade() {
        return product_trade;
    }

    public void setProduct_trade(String product_trade) {
        this.product_trade = product_trade;
    }

    public String getProduct_status() {
        return product_status;
    }

    public void setProduct_status(String product_status) {
        this.product_status = product_status;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_status1() {
        return product_status1;
    }

    public void setProduct_status1(String product_status1) {
        this.product_status1 = product_status1;
    }


}
