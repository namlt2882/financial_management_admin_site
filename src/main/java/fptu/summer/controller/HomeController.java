/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.controller;

import fptu.summer.model.User;
import fptu.summer.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class HomeController {

    public static int PAGE_SIZE = 5;

    @Secured({"ROLE_ADMIN"})
    @GetMapping(value = "/home")
    public String getHomePage(ModelMap modelMap,
            @RequestParam(required = false, defaultValue = "1") Integer startPage,
            @RequestParam(required = false, defaultValue = "") String username) {
        UserService userService = new UserService();
        List<User> userList;
        if ("".equals(username)) {
            userList = userService.findInRange((startPage - 1) * PAGE_SIZE, PAGE_SIZE);
            long numOfUser = userService.countUser();
            modelMap.addAttribute("pageQuantity", Math.ceil(numOfUser * 1.0 / PAGE_SIZE));
            modelMap.addAttribute("numberOfUser", numOfUser);
        } else {
            userList = new ArrayList<>();
            userList.add(userService.findByUsername(username));
        }
        modelMap.addAttribute("users", userList);
        return "home";
    }
}
