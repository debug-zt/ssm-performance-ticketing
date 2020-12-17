package com.ssm.service;

import com.ssm.bean.AllShow;

import java.util.List;

/**
 * description
 * author:zxc
 * date: 2020/11/23
 */
public interface ShowService {
    public String getShowByID(int showId);
    public String getShowByKeyWord(String keyWord);
    public String getShowByKeyWordWithSort(String keyWord, String sortAttrib, String sortWay);
    public String addShow(AllShow allShow,String fileName);
    public String updateShow(AllShow allShow);
    public String deleteShow(long showId);
    public String deleteBatchShow(String showIds);
    public List<AllShow> getAllshow();
    public List<AllShow> getShowByKeyWord2(String keyWord);
    public List<AllShow> getShowByC(String showCate);
}
