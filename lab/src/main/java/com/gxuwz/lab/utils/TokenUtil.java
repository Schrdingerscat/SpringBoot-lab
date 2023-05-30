package com.gxuwz.lab.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.gxuwz.lab.entry.User;
import org.springframework.stereotype.Service;

@Service
public class TokenUtil {
    /**
     * 根据用户名和密码，使用加密算法生成JWT的token令牌。
     * @param user
     * @return
     */
    public String getToken(User user) {
        String token = "";
        token = JWT.create().withAudience(String.valueOf(user.getUserId()))
                .sign(Algorithm.HMAC256(user.getPwd()));
        return token;
    }
}
