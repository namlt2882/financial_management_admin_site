/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.service;

import fptu.summer.dao.UserDAO;
import fptu.summer.model.Role;
import fptu.summer.model.User;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserService {

    public UserService() {
    }

    public List<User> findInRange(Integer firstResult, Integer maxResult) {
        UserDAO userDAO = new UserDAO();
        return userDAO.findUserInRange(firstResult, maxResult);
    }

    public long countUser() {
        return new UserDAO().count();
    }
    
    public User findByUsername(String username){
        return new UserDAO().findByUsername(username);
    }

}
