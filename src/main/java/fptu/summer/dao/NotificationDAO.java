/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.dao;

import fptu.summer.model.Notification;

/**
 *
 * @author ADMIN
 */
public class NotificationDAO extends DAO {

    public Notification insert(Notification notification) {
        try {
            begin();
            getSession().save(notification);
            commit();
            return notification;
        } catch (Exception e) {
            rollback();
            throw e;
        } finally {
            close();
        }
    }
}
