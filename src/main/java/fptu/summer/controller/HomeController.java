/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author ADMIN
 */
@Controller
public class HomeController {

    @GetMapping(value = "/home")
    public String getHomePage() {
        return "home";
    }
}
