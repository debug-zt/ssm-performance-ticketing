package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.ssm.bean.AllShow;
import com.ssm.dao.ShowMapper;
import com.ssm.service.ShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * description
 * author:zxc
 * date: 2020/11/23
 */
@Service
public class ShowServiceImpl implements ShowService {
    @Autowired
    ShowMapper showMapper;

    public String getShowByID(int showId){
        String result = " ";
        AllShow show = showMapper.getShowById(showId);
        Gson gson = new Gson();
        result = gson.toJson(show);
        return result;
    }

    @Override
    public List<AllShow> getShowByC(String showCate) {
        List<AllShow> shows = showMapper.getShowByCate(showCate);
        return shows;
    }

    public String getShowByKeyWord(String keyWord){
        String result = " ";
        List<AllShow> showList = showMapper.getShowByKeyWord(keyWord);
        Gson gson = new Gson();
        result = gson.toJson(showList);
        return result;
    }

    public String getShowByKeyWordWithSort(String keyWord, String sortAttrib, String sortWay){
        String result = " ";
        List<AllShow> showList = showMapper.getShowByKeyWordWithSort(keyWord, sortAttrib, sortWay);
        Gson gson = new Gson();
        result = gson.toJson(showList);
        return result;
    }

    public String addShow(AllShow allShow,String fileName){
        String result = " ";
        allShow.setShowPic("img/"+fileName);
        int sa = showMapper.addShow(allShow);
        if(sa!=0){
            result = "添加成功！";
        }
        else{
            result = "添加失败！";
        }
        return result;
    }

    @Override
    public String updateShow(AllShow allShow) {
        String result = "";
        int sa = showMapper.updateShow(allShow);
        if(sa!=0){
            result = "修改成功！";
        } else {
            result = "修改失败！请重试";
        }
        return result;
    }

    @Override
    public String deleteShow(long showId) {
        String result = " ";
        int sa = showMapper.deleteShow(showId);
        if(sa!=0){
            result = "删除成功！";
        }
        else {
            result = "删除失败！";
        }
        return result;
    }

    @Override
    public String deleteBatchShow(String showIds) {
        String result = "";
        int i =0;
        List<Long> ids = JSONObject.parseArray(showIds,Long.class);
        for(long showId:ids){
            i += showMapper.deleteShow(showId);
        }
        if(i==ids.size()){
            result="删除成功！";
        }else{
            result="删除失败！请重试";
        }
        return result;
    }


    @Override
    public List<AllShow> getAllshow() {
        List<AllShow> shows = showMapper.getAllShow();
        return shows;
    }


    @Override
    public List<AllShow> getShowByKeyWord2(String keyWord){
        List<AllShow> showList = showMapper.getShowByKeyWord2(keyWord);
        return showList;
    }

}
