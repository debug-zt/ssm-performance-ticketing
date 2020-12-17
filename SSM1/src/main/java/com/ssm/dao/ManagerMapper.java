package com.ssm.dao;

import com.ssm.bean.Manager;

/**
 * description
 * author:zxc
 * date: 2020/12/8
 */
public interface ManagerMapper {
    public int updateManager(Manager manager);
    public Manager findManager(String managerName);
}
