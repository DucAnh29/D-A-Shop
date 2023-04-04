package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public ProductDAO() {
        connectDB();
    }

    private void connectDB() {
        try {
            Connection cnn = (new DBContext()).connection;
            System.out.println("Connect successful");
        } catch (SQLException e) {
            System.err.println("Connect error " + e.getMessage());
        }
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
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

    public List<Product> getAllProductPaging(int currentPage) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ORDER BY ProductID OFFSET 0 + ? * 8 ROWS FETCH NEXT 8 ROWS ONLY";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, currentPage);
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

    public Product getProductsByProductID(int ProductID) {
        String sql = "select * from Product where ProductID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Product(rs.getInt("ProductID"),
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
        return null;
    }

    public List<Product> SearchProduct(String txtSearch, int lowestPrice, int highestPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where [Name] like ? and [Price] >= ? and [Price] <= ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, lowestPrice);
            ps.setInt(3, highestPrice);
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

    public List<Product> NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 8 * from Product order by ProductID desc";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
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

    public List<Product> getTop4ProductByCategoryID(int cateID, int productID) {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product where CategoryID = ? and ProductID != ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, cateID);
            ps.setInt(2, productID);
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

    public void deleteProduct(String ProductID) {
        String sql = "delete from Product where ProductID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product product) {
        String sql = "update Product set [Name] = ?, [Price] = ?, [Image] = ?, [Description] = ?, [Quantity] = ?, [CategoryID] = ? where ProductId = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getImage());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getQuantity());
            ps.setInt(6, product.getCategoryID());
            ps.setInt(7, product.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(String Name, double Price, String Image, String Description, int Quantity, int CategoryID) {
        String sql = "insert into Product ([Name],[Price],[Image],[Description],[Quantity],[CategoryID]) values (?,?,?,?,?,?)";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setDouble(2, Price);
            ps.setString(3, Image);
            ps.setString(4, Description);
            ps.setInt(5, Quantity);
            ps.setInt(6, CategoryID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
