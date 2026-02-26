/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import utils.DbUtils;
import utils.JPAUtil;

/**
 *
 * @author tungi
 */
public class UserDAO {

    public UserDAO() {
    }

    public UserDTO searchById(String username) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.find(UserDTO.class, username);
        } finally {
            em.close();
        }
    }

    public UserDTO login(String username, String password) {
        UserDTO u = searchById(username);
        if (u != null && u.getPassword().equals(password)) {
            return u;
        }
        return null;
    }

}
