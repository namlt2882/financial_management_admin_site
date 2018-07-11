/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.controller;

import fptu.summer.model.User;
import fptu.summer.service.AuthenticationService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ltnam1
 */
@Controller
public class AuthenticationController {

    @GetMapping(value = {"index", "/"})
    public String index(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return "redirect:/home";
        }
        return "index";
    }

    @PostMapping(value = "login")
    public String login(HttpServletRequest request, @RequestParam String username, @RequestParam String password) {
        AuthenticationService authenticationService = new AuthenticationService();
        User tmp = new User(username, password);
        User user = authenticationService.checkLogin(tmp);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("USER", user);
            return "redirect:home";
        }
        return "redirect:index";
    }

    @PostMapping(value = "logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

}
