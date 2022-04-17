package cn.aa.tool;

import com.fasterxml.jackson.databind.ObjectMapper;
import cn.aa.pojo.Admin;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class MyInterceptor implements HandlerInterceptor {
    @Resource
    private RedisTemplate redisTemplate;
    @Resource
    private ObjectMapper objectMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Cookie[] cookies = request.getCookies();

        String token = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {

                if ("VIDEO_TICKET".equals(cookie.getName())) {
                    token = cookie.getValue();
                    break;
                }
            }
        }

        //判断token是否为null
        if (!StringUtils.isEmpty(token)) {

            //判断redis缓存中是否有数据
            String userJSON = (String) redisTemplate.opsForValue().get(token);

            if (!StringUtils.isEmpty(userJSON)) {

                Admin admin = objectMapper.readValue(userJSON, Admin.class);
                //可以将user信息保持到request域中/session域 但是该方法无法在业务层中动态获取userId
                //需要在业务接口中 添加userId等信息
                //request.setAttribute("JT_USER", user);

                //放行请求
                UserThreadLocal.set(admin);
                request.getSession().setAttribute("admin", admin);

                return true;
            }
        }
        request.getSession().setAttribute("page", request.getHeader("Referer"));


        //如果程序执行到这里说明用户登陆有误,则需要重新登陆
        response.sendRedirect("/loginRegister/page/login.html");
        return false; //表示拦截



    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }

}
