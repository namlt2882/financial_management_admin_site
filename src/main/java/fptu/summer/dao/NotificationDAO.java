/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.dao;

import fptu.summer.model.Notification;
import fptu.summer.model.User;
import fptu.summer.model.enumeration.NotificationStatus;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

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

    public List<Notification> findUserInRange(Integer firstResult, Integer maxResult,
            boolean isFilter, boolean isSystemNotification) {
        try {
            Criteria criteria = getSession().createCriteria(Notification.class)
                    .add(Restrictions.eq("status", NotificationStatus.ENABLE.getStatus()))
                    .addOrder(Order.desc("insertDate"));
            if (firstResult != null) {
                criteria.setFirstResult(firstResult);
            }
            if (maxResult != null) {
                criteria.setMaxResults(maxResult);
            }
            if (isFilter) {
                criteria.add(Restrictions.eq("isSystemNotification", isSystemNotification));
            }
            return criteria.list();
        } finally {
            close();
        }
    }

    public List<Notification> findByUserIdInRange(Integer firstResult, Integer maxResult, Integer userId) {
        try {
            if (userId == null) {
                return new LinkedList<>();
            }
            Criteria criteria = getSession().createCriteria(Notification.class)
                    .add(Restrictions.eq("status", NotificationStatus.ENABLE.getStatus()))
                    .addOrder(Order.desc("insertDate"));
            if (firstResult != null) {
                criteria.setFirstResult(firstResult);
            }
            if (maxResult != null) {
                criteria.setMaxResults(maxResult);
            }
            criteria.add(Restrictions.eq("user.id", userId));
            return criteria.list();
        } finally {
            close();
        }
    }

    public long count(boolean isFilter, boolean isSystemNotification) {
        try {
            Criteria criteria = getSession().createCriteria(Notification.class)
                    .add(Restrictions.eq("status", NotificationStatus.ENABLE.getStatus()));
            if (isFilter) {
                criteria.add(Restrictions.eq("isSystemNotification", isSystemNotification));
            }
            return (long) criteria.setProjection(Projections.rowCount()).uniqueResult();
        } finally {
            close();
        }
    }

    public long countByUserId(Integer userId) {
        try {
            if (userId == null) {
                return 0;
            }
            return (long) getSession().createCriteria(Notification.class)
                    .add(Restrictions.eq("status", NotificationStatus.ENABLE.getStatus()))
                    .add(Restrictions.eq("user.id", userId))
                    .setProjection(Projections.rowCount()).uniqueResult();
        } finally {
            close();
        }
    }

    public Notification findById(Long id) {
        try {
            return (Notification) getSession().get(Notification.class, id);
        } finally {
            close();
        }
    }

    public void update(Notification notification) {
        try {
            begin();
            getSession().update(notification);
            commit();
        } catch (Exception e) {
            rollback();
            throw e;
        } finally {
            close();
        }
    }
    
}
