/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author Dell
 */
public class TokenForgetPassword {
    private int user_id;
    private boolean isUsed;
    private String token;
    private LocalDateTime expireTime;

    public TokenForgetPassword() {
    }

    public TokenForgetPassword(int user_id, boolean isUsed, String token, LocalDateTime expireTime) {
        this.user_id = user_id;
        this.isUsed = isUsed;
        this.token = token;
        this.expireTime = expireTime;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDateTime getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(LocalDateTime expireTime) {
        this.expireTime = expireTime;
    }

    
    
}
