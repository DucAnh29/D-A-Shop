package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

public class CategoryDAO {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"),
                        rs.getString("Name")));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getProductByCategoryID(String CategoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "select *from Product where CategoryID =?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"),
                        rs.getString("Name"),
                        rs.getDouble("Price"),
                        rs.getString("Image"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getInt("CategoryID")));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Category getCategoryByCategoryID(String categoryID) {
        String sql = "select * from Category where CategoryID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("Name")
                );
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
