/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.service;

import fptu.summer.dao.NotificationDAO;
import fptu.summer.model.Notification;
import fptu.summer.model.User;
import fptu.summer.model.enumeration.NotificationStatus;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class NotificationService {

    UserService userService = new UserService();

    public Notification addNotification(Notification notification, String username) {
        if (username != null) {
            //personal notification
            User user = userService.findByUsername(username);
            notification.setUserId(user.getId());
            notification.setIsSystemNotification(false);
        } else {
            //system notification
            notification.setIsSystemNotification(true);
            notification.setUserId(null);
        }
        notification.setStatus(NotificationStatus.ENABLE.getStatus());
        Date currentDate = new Date();
        notification.setInsertDate(currentDate);
        notification.setLastUpdate(currentDate);
        return new NotificationDAO().insert(notification);
    }
}
