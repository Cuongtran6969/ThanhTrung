/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author HP
 */
public class DAOAccount extends DBContext {
    //ham lay du lieu cua user trong database
    public Account validateAccount(String email, String password) {
        String sql = "Select * from Account where email = ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                return new Account(
                        rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getBoolean(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "Select * from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getBoolean(8));
                list.add(acc);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean insertAccount(Account acc) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([firstName]\n"
                + "           ,[lastName]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, acc.getFirstName());
            ps.setString(2, acc.getLastName());
            ps.setString(3, acc.getPassword());
            ps.setString(4, acc.getEmail());
            ps.setString(5, acc.getPhone());
            ps.setBoolean(6, acc.isIsAdmin());
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
