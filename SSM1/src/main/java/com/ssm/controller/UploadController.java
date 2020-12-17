package com.ssm.controller;

import com.ssm.bean.User;
import com.ssm.dao.UserMapper;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/**
 *
 */
@Controller
public class UploadController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "singleFileUpload.do", method = RequestMethod.POST)
    public ModelAndView singleFileUpload(String userId, MultipartFile uploadFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        String fileName = "";
        //原始的文件名字
        String uploadFileName = uploadFile.getOriginalFilename();
        //2.截取文件扩展名
        String extendName = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1, uploadFileName.length());

        //3.把文件加上随机数，防止文件重复，并去掉“-”
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();

        fileName = uuid + "_" + uploadFileName;

        //获取上传的真实的服务器路径
        String basePath = request.getServletContext().getRealPath("/img");
//        String basePath = "C:/Users/85729/IdeaProjects/SSM1(2020.12.14)/SSM1/src/main/webapp/img";
        //3.解决同一文件夹中文件过多问题，每一天建立一个文件夹
//        String datePath = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //4.判断路径是否存在
//        File file = new File(basePath);
        File file = new File(basePath);

        if (!file.exists()) {
            file.mkdirs();
        }

        //5.使用 MulitpartFile 接口中方法，把上传的文件写到指定位置
        File f = new File(file, fileName);
        //上传
        uploadFile.transferTo(f);
        System.out.println("文件上传成功:" + f.getAbsolutePath());
        userService.uploadHead(fileName,userId,request,response);
        mv.addObject("mes","修改成功!");
        mv.setViewName("redirect:/userdata.jsp");
        return mv;
    }


    /**
     * Description: 多文件上传<br/>
     */
    @RequestMapping(value = "/multiFileUpload.do", method = RequestMethod.POST)
    public void multiFileUpload(MultipartRequest files, HttpServletRequest request) throws Exception {
        //获取传过来的文件集合
        Map<String, MultipartFile> filesMap = files.getFileMap();
        Set<String> keySet = filesMap.keySet();
        //遍历每一个文件
        for (String key : keySet) {
            String fileName = "";
            MultipartFile singleFile = filesMap.get(key);
            //文件名
            String originalFile = singleFile.getOriginalFilename();
            //扩展名
            String extendName = originalFile.substring(originalFile.lastIndexOf(".") + 1, originalFile.length());
            //把文件加上随机数，防止文件重复，并去掉“-”
            String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
            fileName = uuid + "_" + "." + extendName;
            String basePath = request.getServletContext().getRealPath("/uploads");
            //3.解决同一文件夹中文件过多问题，每一天建立一个文件夹
            String datePath = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            //4.判断路径是否存在
            File file = new File(basePath + "/" + datePath);
            if (!file.exists()) {
                file.mkdirs();
            }

            File f = new File(file, fileName);
            //上传
            singleFile.transferTo(f);
            System.out.println("文件上传成功:" + f.getAbsolutePath());
        }
    }
}

