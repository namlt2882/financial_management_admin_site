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
import java.util.List;

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
            notification.setUser(new User(user.getId()));
            notification.setIsSystemNotification(false);
        } else {
            //system notification
            notification.setIsSystemNotification(true);
            notification.setUser(null);
        }
        notification.setStatus(NotificationStatus.ENABLE.getStatus());
        Date currentDate = new Date();
        notification.setInsertDate(currentDate);
        notification.setLastUpdate(currentDate);
        return new NotificationDAO().insert(notification);
    }

    public List<Notification> findInRange(Integer firstResult, Integer maxResult,
            boolean isFilter, boolean isSystemNotification, String username) {
        NotificationDAO notificationDAO = new NotificationDAO();
        User user = null;
        if (username != null && !"".equals(username.trim().toUpperCase())) {
            user = new UserService().findByUsername(username);
            return notificationDAO.findByUserIdInRange(firstResult, maxResult, user != null ? user.getId() : null);
        }
        return notificationDAO.findUserInRange(firstResult, maxResult, isFilter, isSystemNotification);
    }

    public long countNotification(boolean isFilter, boolean isSystemNotification, String username) {
        User user = null;
        if (username != null && !"".equals(username)) {
            user = new UserService().findByUsername(username.trim().toUpperCase());
            return new NotificationDAO().countByUserId(user != null ? user.getId() : null);
        }
        return new NotificationDAO().count(isFilter, isSystemNotification);
    }

    public Notification findById(Long id) {
        return new NotificationDAO().findById(id);
    }
    
    public void disable(Long id){
        NotificationDAO notificationDAO = new NotificationDAO();
        Notification notification = notificationDAO.findById(id);
        notification.setStatus(NotificationStatus.DISABLE.getStatus());
        notification.setLastUpdate(new Date());
        notificationDAO.update(notification);
    }
}
