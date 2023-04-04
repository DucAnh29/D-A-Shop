/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class CartDetail {
    private int CartID;
    private int Size;
    private int Quantity;
    private int ProductID;
    private Product product;

    public CartDetail() {
    }

    public CartDetail(int CartID, int Size, int Quantity, int ProductID, Product product) {
        this.CartID = CartID;
        this.Size = Size;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
        this.product = product;
    }
    
    public CartDetail(int CartID, int Size, int Quantity, int ProductID) {
        this.CartID = CartID;
        this.Size = Size;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
    }
    
    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
