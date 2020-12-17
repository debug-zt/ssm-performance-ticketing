package com.ssm.bean;

import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * description
 * author:zxc
 * date: 2020/11/23
 */

public class AllShow {
    private int showId;
    private String showName;
    private String showCate;
    private String showDate;
    private int showPrice;
    private String showPosit;
    private int remainTicket;
    private String showPic;

    public void setShowId(int showId){
        this.showId = showId;
    }
    public int getShowId(){
        return this.showId;
    }

    public void setShowName(String showName){
        this.showName = showName;
    }
    public String getShowName(){
        return this.showName;
    }

    public void setShowCate(String showCate){
        this.showCate = showCate;
    }
    public String getShowCate(){
        return this.showCate;
    }

    public void setShowDate(String showDate){
        this.showDate = showDate;
    }
    public String getShowDate(){
        return this.showDate;
    }

    public void setShowPrice(int showPrice){
        this.showPrice = showPrice;
    }
    public int getShowPrice(){
        return this.showPrice;
    }

    public void setShowPosit(String showPosit){
        this.showPosit = showPosit;
    }
    public String getShowPosit(){
        return this.showPosit;
    }

    public void setRemainTicket(int remainTicket){
        this.remainTicket = remainTicket;
    }
    public int getRemainTicket(){
        return this.remainTicket;
    }

    public void setShowPic(String showPic){
        this.showPic = showPic;
    }
    public String getShowPic(){
        return this.showPic;
    }

    public AllShow(){
    }

    public AllShow(int showId, String showName, String showCate, String showDate,
                   int showPrice, String showPosit, int remainTicket, String showPic){
        super();
        this.showId = showId;
        this.showName = showName;
        this.showCate = showCate;
        this.showDate = showDate;
        this.showPrice = showPrice;
        this.showPosit = showPosit;
        this.remainTicket = remainTicket;
        this.showPic = showPic;
    }

    @Override
    public String toString() {
        return "AllShow{" +
                "showId=" + showId +
                ", showName='" + showName + '\'' +
                ", showCate='" + showCate + '\'' +
                ", showDate=" + showDate +
                ", showPrice=" + showPrice +
                ", showPosit='" + showPosit + '\'' +
                ", remainTicket=" + remainTicket +
                ", showPic='" + showPic + '\'' +
                '}';
    }
}
