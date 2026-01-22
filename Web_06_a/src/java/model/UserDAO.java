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
import utils.DbUtils;

/**
 *
 * @author tungi
 */
public class UserDAO {

    public UserDAO() {
    }

    public UserDTO searchById(String username) {
        try {
            Connection conn = DbUtils.getConnection();
            String sql = "SELECT * FROM tblUsers "
                    + " WHERE userID=?";
            System.out.println(sql);
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            
            UserDTO user = null;
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password = rs.getString("password");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");
                user = new UserDTO(userID, fullName, password, roleID, status);
            }
            
            System.out.println(user);
            
            return user;
        } catch (Exception e) {
            return null;
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
