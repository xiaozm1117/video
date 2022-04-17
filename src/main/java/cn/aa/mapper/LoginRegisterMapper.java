package cn.aa.mapper;

import cn.aa.pojo.Admin;

import java.util.List;

public interface LoginRegisterMapper {

    public int register(Admin admin);

    public List<Admin> login(Admin admin);

    public int check(String name);

}
