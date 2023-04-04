/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author Admin
 */
public class Product {
    private int ProductID;
    private String Name;
    private double Price;
    private String Image;
    private String Description;
    private int Quantity;
    private int CategoryID;

    public Product() {
    }

    public Product(int ProductID, String Name, double Price, String Image, String Description,int Quantity ,int CategoryID) {
        this.ProductID = ProductID;
        this.Name = Name;
        this.Price = Price;
        this.Image = Image;
        this.Description = Description;
        this.Quantity = Quantity;
        this.CategoryID = CategoryID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
    
    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getFormatedMoney() {
        DecimalFormat format = new DecimalFormat("0.#");
        return format.format(Price);
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

  
}
