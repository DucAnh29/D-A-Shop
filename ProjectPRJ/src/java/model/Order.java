package model;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Order {
    private int OrderID;
    private int CustomerID;
    private String OrderDate;
    private List<OrderDetail> OrderDetail;

    public Order() {
    }
    
    public Order(int OrderID, int CustomerID, List<OrderDetail> OrderDetail) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.OrderDetail = OrderDetail;
    }

    public Order(int OrderID, int CustomerID, String OrderDate, List<OrderDetail> OrderDetail) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.OrderDate = OrderDate;
        this.OrderDetail = OrderDetail;
    }
    
    public Order(int CustomerID, String OrderDate, List<OrderDetail> OrderDetail) {
        this.CustomerID = CustomerID;
        this.OrderDate = OrderDate;
        this.OrderDetail = OrderDetail;
    }
    
    public Order(int OrderID, String OrderDate) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public List<OrderDetail> getOrderDetail() {
        return OrderDetail;
    }

    public void setOrderDetail(List<OrderDetail> OrderDetail) {
        this.OrderDetail = OrderDetail;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getTotalMoney() {
        double total = 0;
        for (int i = 0; i < this.getOrderDetail().size(); i++) {
            total += (this.getOrderDetail().get(i).getProduct().getPrice() * this.getOrderDetail().get(i).getQuantity());
        }
        return getFormatedMoney(total);
    }
    
    public String getFormatedMoney(double total) {
        DecimalFormat format = new DecimalFormat("0.#");
        return format.format(total);
    }
}
