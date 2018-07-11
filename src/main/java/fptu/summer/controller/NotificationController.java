/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.controller;

import fptu.summer.model.Notification;
import fptu.summer.model.User;
import fptu.summer.service.NotificationService;
import fptu.summer.service.UserService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class NotificationController {

    @Secured({"ROLE_ADMIN"})
    @GetMapping(value = "noti_add")
    public String getAddNotiPage(ModelMap modelMap,
            @RequestParam(required = false, defaultValue = "") String username) {
        if (!"".equals(username)) {
            User user = new UserService().findByUsername(username);
            modelMap.addAttribute("user", user);
        }
        return "noti_add";
    }

    @Secured({"ROLE_ADMIN"})
    @PostMapping(value = "noti_add")
    public String addNotification(ModelMap modelMap,
            @RequestParam(required = false, defaultValue = "") String username,
            @RequestParam String title, @RequestParam String content) {
        String msgError = "";
        boolean validate = true;
        if (title.trim().length() < 5 || title.trim().length() > 100) {
            msgError += "Title length has at least 5 chars at most 100 chars\n";
            validate = false;
        }
        if (title.trim().length() < 10 || content.trim().length() > 300) {
            msgError += "Content length has at least 10 chars at most 300 chars\n";
            validate = false;
        }
        if (validate) {
            Notification notification = new Notification(title, content);
            if ("".equals(username)) {
                //add system notification
                username = null;
            }
            new NotificationService().addNotification(notification, username);
            return "redirect:/home";
        } else {
            modelMap.addAttribute("msg", msgError);
            return "redirect:/noti_add" + ("".equals(username) ? "" : "?username=" + username);
        }
    }
}
