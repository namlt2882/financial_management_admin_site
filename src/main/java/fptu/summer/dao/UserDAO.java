/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.summer.dao;

import fptu.summer.model.Role;
import fptu.summer.model.User;
import fptu.summer.model.enumeration.UserStatus;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DAO {

    public UserDAO() {
        super();
    }

    public User insert(User user) {
        try {
            begin();
            getSession().save(user);
            commit();
            return user;
        } catch (Exception e) {
            rollback();
            throw e;
        } finally {
            close();
        }
    }

    public User update(User user) {
        try {
            begin();
            getSession().update(user);
            commit();
            return user;
        } catch (Exception e) {
            rollback();
            throw e;
        } finally {
            close();
        }
    }

    public User checkLogin(User user) {
        try {
            DetachedCriteria dc = DetachedCriteria.forClass(User.class)
                    .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                    .add(Restrictions.eq("username", user.getUsername()))
                    .add(Restrictions.eq("password", user.getPassword()));
            List<User> l = dc.getExecutableCriteria(getSession()).list();
            if (l != null && l.size() != 0) {
                return l.get(0);
            } else {
                return null;
            }
        } finally {
            close();
        }
    }

    public List<User> findUserInRange(Integer firstResult, Integer maxResult) {
        try {
            Criteria criteria = getSession().createCriteria(User.class, "user")
                    .createAlias("user.roles", "role", Criteria.INNER_JOIN)
                    .add(Restrictions.eq("role.id", 2))
                    .addOrder(Order.desc("user.insertDate"));
            if (firstResult != null) {
                criteria.setFirstResult(firstResult);
            }
            if (maxResult != null) {
                criteria.setMaxResults(maxResult);
            }
            return criteria.list();
        } finally {
            close();
        }
    }

    public long count() {
        try {
            return (long) getSession().createCriteria(User.class, "user")
                    .createAlias("user.roles", "role", Criteria.INNER_JOIN)
                    .add(Restrictions.eq("role.id", 2))
                    .setProjection(Projections.rowCount()).uniqueResult();
        } finally {
            close();
        }
    }

    public User findByUsername(String username) {
        try {
            return (User) getSession()
                    .createCriteria(User.class)
                    .add(Restrictions.eq("username", username)).uniqueResult();
        } finally {
            close();
        }
    }

    public User findById(Integer id) {
        try {
            return (User) getSession().get(User.class, id);
        } finally {
            close();
        }
    }

}
