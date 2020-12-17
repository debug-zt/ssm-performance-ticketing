package com.ssm.service;

import com.ssm.bean.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * description
 * author:zxc
 * date: 2020/12/8
 */
public interface ManagerService {
    public String updateManagerPassword(long opwd, long npwd, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;
    public String managerLogin(String managerName, long password);
    public String deleteCookie(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException;
}
