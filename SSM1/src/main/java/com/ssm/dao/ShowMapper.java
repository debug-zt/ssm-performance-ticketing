package com.ssm.dao;

import com.ssm.bean.AllShow;

import java.util.List;

/**
 * description
 * author:zxc
 * date: 2020/11/23
 */
public interface ShowMapper {
    public List<AllShow> getAllShow();
    public int addShow(AllShow Show);
    public int deleteShow(long showId);
    public int updateShow(AllShow show);
    public AllShow getShowById(int showId);
    public List<AllShow> getShowByKeyWord(String key);
    public List<AllShow> getShowByKeyWordWithSort(String Key, String SortAttrib, String SortWay);
    public List<AllShow> getShowByCate(String showCate);
    public List<AllShow> getShowByKeyWord2(String key);
}
