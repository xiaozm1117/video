package cn.aa.controller;
import cn.aa.pojo.Admin;
import cn.aa.service.LoginRegisterService;
import cn.aa.tool.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/loginRegister")
public class LoginRegister {
    @Resource
    private LoginRegisterService loginRegisterService;

    @RequestMapping("/page/register")
    public String pageRegister() {
        return "register";
    }

    @RequestMapping("/page/login")
    public String pageLogin() {
        return "login";
    }

    @RequestMapping("/register")
    @ResponseBody
    public Result regiester(Admin admin) {
        try {
            loginRegisterService.register(admin);
            return new Result("ok");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");

    }

    @RequestMapping("/login")
    @ResponseBody
    public Result login(Admin admin, HttpServletResponse response) {
        try {
            String token = loginRegisterService.login(admin);

            Cookie cookie = new Cookie("VIDEO_TICKET", token);
            cookie.setPath("/"); //表示在浏览器根目录生效
            cookie.setMaxAge(3600 * 24 * 7); //设定生命周期 单位秒
            response.addCookie(cookie);
            return new Result("ok");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");

    }


    @RequestMapping("/check")
    @ResponseBody
    public Result check(@RequestParam String name) {
        try {
            if(loginRegisterService.check(name)==1)
            {
                return new Result("ok");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");
    }


}
