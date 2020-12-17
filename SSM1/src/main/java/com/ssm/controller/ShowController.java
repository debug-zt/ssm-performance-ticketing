package com.ssm.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ssm.bean.AllShow;
import com.ssm.service.ShowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * description
 * author:zxc
 * date: 2020/11/24
 */
@Controller
public class ShowController {

    @Resource
    ShowService showService;

    @RequestMapping(value = "show/getShowByID", method = RequestMethod.GET)
    public ModelAndView getShowById(int showId){
        String result = showService.getShowByID(showId);
        ModelAndView mv = new ModelAndView();
        Gson gson = new Gson();
        AllShow show = gson.fromJson(result, AllShow.class);
        mv.addObject("showResult", result);
        mv.setViewName("redirect:/showDetail.jsp");
        return mv;

    }

    @RequestMapping(value = "show/getShowByC")
    @ResponseBody
    public List<AllShow> getShowByC(String showCate){
        List<AllShow> shows = showService.getShowByC(showCate);
        return shows;
    }

    @RequestMapping(value = "show/search", method = RequestMethod.GET)
    public ModelAndView getShowByKey(String keyWord){
        ModelAndView mv = new ModelAndView();
/*        if (keyWord.equals("")){
            mv.addObject("error","请输入关键词");
            mv.setViewName("index");
            return mv;
        }*/
        String result = showService.getShowByKeyWord(keyWord);
        Gson gson = new Gson();
        TypeToken<List<AllShow>> list = new TypeToken<List<AllShow>>(){};
        List<AllShow> showList = gson.fromJson(result, list.getType());
        if(showList.size() == 0){
            mv.addObject("msg", "很抱歉，未能搜索到相关信息");
        }
        else {
            mv.addObject("showListGson", result);
        }
        mv.addObject("KeyWord", keyWord);
        mv.setViewName("redirect:/searchResult.jsp");
        return mv;
    }

    @RequestMapping(value = "show/searchSort", method = RequestMethod.GET)
    public ModelAndView getShowByKeyWithSort(String keyWord, String sortAttrib, String sortWay){
        ModelAndView mv = new ModelAndView();
        if (keyWord.equals("")){
            mv.addObject("error","请输入关键词");
            mv.setViewName("index");
            return mv;
        }
        String result = showService.getShowByKeyWordWithSort(keyWord, sortAttrib, sortWay);
        if(result == null){
            mv.addObject("msg", "很抱歉，未能搜索到相关信息");
        }
        else {
            mv.addObject("showListGson", result);

        }
        mv.addObject("KeyWord", keyWord);
        mv.addObject("sort",sortAttrib + sortWay);
        mv.setViewName("redirect:/searchResult.jsp");
        return mv;
    }

    @RequestMapping(value = "show/getShowDynamic", method = RequestMethod.GET)
    @ResponseBody
    public List<AllShow> getShowDynamic(String keyWord, String sortAttrib, String sortWay){
        List<AllShow> showList;
        Gson gson = new Gson();
        TypeToken<List<AllShow>> list = new TypeToken<List<AllShow>>(){};

        if (keyWord.equals("null")){
                keyWord = "";
        }
        if (sortAttrib.equals("")){
            showList = gson.fromJson(showService.getShowByKeyWord(keyWord), list.getType());
        }else if (sortWay.equals("")){
            showList = gson.fromJson(showService.getShowByKeyWordWithSort(keyWord, sortAttrib, "DESC"), list.getType());
        }else {
            showList = gson.fromJson(showService.getShowByKeyWordWithSort(keyWord, sortAttrib, sortWay), list.getType());
        }
        return showList;
    }




    @RequestMapping(value = "show/addShow", method = RequestMethod.POST)
    public ModelAndView addShow(AllShow allShow, MultipartFile uploadFile ,HttpServletRequest request) throws Exception {
        ModelAndView mv =new ModelAndView();

        String fileName = "";

        String uploadFileName = uploadFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        fileName = uuid + "_" + uploadFileName;

//        //上传至src
//        String basePath = "C:/Users/85729/IdeaProjects/SSM1(2020.12.14)/SSM1/src/main/webapp/img";
//        File file = new File(basePath);
//        if (!file.exists()) {
//            file.mkdirs();
//        }
//        File f = new File(file, fileName);
//        uploadFile.transferTo(f);
//        System.out.println("文件上传成功:" + f.getAbsolutePath());

        //上传至target 服务器文件夹
        String basePath = request.getServletContext().getRealPath("/img");
        File file = new File(basePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        File f = new File(file, fileName);
        uploadFile.transferTo(f);
        System.out.println("文件上传成功:" + f.getAbsolutePath());

        String re = showService.addShow(allShow,fileName);
        mv.addObject("mes",re);
        mv.setViewName("/admin/insert");
        return mv;
    }

    @RequestMapping(value = "show/getAll")
    @ResponseBody
    public List<AllShow> getAllshow(){
        List<AllShow> shows = showService.getAllshow();
        return shows;
    }

    @RequestMapping(value = "show/deleteShow",method = RequestMethod.GET)
    public ModelAndView deleteShow(long showId){
        ModelAndView mv = new ModelAndView();
        String re = showService.deleteShow(showId);
        mv.addObject("msg",re);
        mv.setViewName("redirect:/admin/design.jsp");
        return mv;
    }

    @RequestMapping(value = "/show/deleteSome" ,method = RequestMethod.GET)
    public ModelAndView deleteSomeShow(String showIds){
        ModelAndView mv = new ModelAndView();
        String result = showService.deleteBatchShow(showIds);
        mv.addObject("msg",result);
        mv.setViewName("redirect:/admin/design.jsp");
        return mv;
    }

    @RequestMapping(value = "show/update",method = RequestMethod.POST ,produces = {"application/String;charset=UTF-8"})
    @ResponseBody
    public String updateShow(AllShow show){
        String result = showService.updateShow(show);
        return result;
    }


    @RequestMapping(value = "show/search2")
    @ResponseBody
    public List<AllShow> getShowByKey2(String keyWord) {
        List<AllShow> shows = showService.getShowByKeyWord2(keyWord);
        return shows;
    }

}
