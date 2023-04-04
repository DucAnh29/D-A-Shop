/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int OrderID;
    private int Size;
    private int Quantity;
    private int ProductID;
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public OrderDetail() {
    }

    public OrderDetail(int OrderID, int Size, int Quantity, int ProductID, Product product) {
        this.OrderID = OrderID;
        this.Size = Size;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
        this.product = product;
    }

    public OrderDetail(int OrderID, int Size, int Quantity, int ProductID) {
        this.OrderID = OrderID;
        this.Size = Size;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getSize() {
        return Size;
    }

    public void setSize(int Size) {
        this.Size = Size;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }
}
