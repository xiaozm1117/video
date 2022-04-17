package cn.aa.service;

import cn.aa.pojo.Admin;

public interface LoginRegisterService {

    public void register(Admin admin);

    public String login(Admin admin);

    public int check(String name);


}
