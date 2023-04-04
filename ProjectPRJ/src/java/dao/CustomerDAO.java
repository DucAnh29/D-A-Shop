package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

/**
 *
 * @author Admin
 */
public class CustomerDAO {

    public CustomerDAO() {
        connectDB();
    }

    Connection cnn; 
    Statement stm; 
    ResultSet rs; 

    private void connectDB() {
        try {
            cnn = (new DBContext()).connection;
            System.out.println("Connect successful");
        } catch (SQLException e) {
            System.err.println("Connect error " + e.getMessage());
        }
    }

    public Customer checkLogin(String Email, String Password) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Customer where [Email] = '" + Email + "' and [Password] = '" + Password + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return new Customer(
                        rs.getInt("CustomerID"),
                        rs.getString("CustomerName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("Password"),
                        rs.getString("Role")
                );
            }
        } catch (SQLException e) {
            System.err.println("Login error " + e.getMessage());
        }
        return null;
    }

    public void resigter(String CustomerName, String Email, String Phone, String Address, String Password) {
        String insert = "insert into Customer ([CustomerName],[Email],[Phone],[Address],[Password]) values (?,?,?,?,?)";
        try {
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setString(1, CustomerName);
            ps.setString(2, Email);
            ps.setString(3, Phone);
            ps.setString(4, Address);
            ps.setString(5, Password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }

    public void register(Customer customer) {
        CartDAO cartDAO = new CartDAO();
        String insert = "insert into Customer ([CustomerName],[Email],[Phone],[Address],[Password]) values (?,?,?,?,?)";
        try {
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }

    public boolean checkExist(String email, String phone) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Customer where [Email] = '" + email + "' or [Phone] = '" + phone + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("Login error " + e.getMessage());
        }
        return false;
    }

    public boolean checkIsEmailExisted(String email) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Customer where [Email] = ?";
            PreparedStatement ps = cnn.prepareStatement(strSelect);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public void updatePassword(String password, String email) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "update Customer set [Password] = ? where Email = ?";
            PreparedStatement ps = cnn.prepareStatement(strSelect);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Customer getCustomerByCustomerID(int CustomerID) {
        String sql = "select * from Customer where CustomerID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, CustomerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Customer(rs.getInt("CustomerID"),
                        rs.getString("CustomerName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("Password"),
                        rs.getString("Role")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCustomer(Customer customer) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "update Customer set [CustomerName] = ?, [Phone] = ?, [Address] = ? ,[Password] = ? where [CustomerID] = ?";
            PreparedStatement ps = cnn.prepareStatement(strSelect);
            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getPhone());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getPassword());
            ps.setInt(5, customer.getCustomerID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
     public void updateRoleCustomer(Customer customer) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "update Customer set [Role] = ? where [CustomerID] = ?";
            PreparedStatement ps = cnn.prepareStatement(strSelect);
            ps.setString(1, customer.getRole());
            ps.setInt(2, customer.getCustomerID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Customer getNewCustomer() {
        String sql = "select top 1  * from  Customer order by CustomerID desc";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Customer(rs.getInt("CustomerID"),
                        rs.getString("CustomerName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("Password")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from Customer";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt("CustomerID"),
                        rs.getString("CustomerName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("Password"),
                        rs.getString("Role")));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
