/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;

/**
 *
 * @author Dell
 */

public class LoginResult {
    private User user;
    private String errorMessage;

    public LoginResult(User user, String errorMessage) {
        this.user = user;
        this.errorMessage = errorMessage;
    }

    public User getUser() {
        return user;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}


