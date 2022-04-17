package cn.aa.service;

import cn.aa.mapper.LoginRegisterMapper;
import cn.aa.pojo.Admin;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginRegisterServiceImpl implements LoginRegisterService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
    @Autowired
    private LoginRegisterMapper loginRegisterMapper;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ObjectMapper objectMapper;
    @Override
    public void register(Admin admin) {
        String password = admin.getPassword();
        admin.setPassword(DigestUtils.md5Hex(password));
        try {
            loginRegisterMapper.register(admin);

        } catch (Exception e) {
            throw new RuntimeException();
        }


    }

    @Override
    public String login(Admin admin) {

        logger.info("info set 1");


        redisTemplate.opsForValue().set("xiaozm","1111111111");

        logger.info("info set 2");
        String token = "";
        String password = admin.getPassword();
        admin.setPassword(DigestUtils.md5Hex(password));
        List<Admin> userList = loginRegisterMapper.login(admin);

        if (userList == null || userList.isEmpty()) throw new RuntimeException();

        admin = userList.get(0);

        try {
            String userJSON = objectMapper.writeValueAsString(admin);
            //md5（“JT_TICKET_” + System.currentTime + username）
            token = DigestUtils.md5Hex("VIDEO_TICKET" + System.currentTimeMillis() + admin.getName());
            redisTemplate.opsForValue().set(token, userJSON);
            

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }

        return token;

    }

    @Override
    public int check(String name) {
        try {
            return loginRegisterMapper.check(name);

        } catch (Exception e) {
            throw new RuntimeException();
        }
    }
}
