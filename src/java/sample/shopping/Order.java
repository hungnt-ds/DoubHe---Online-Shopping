/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author TANHUNG
 */
public class Order {

    int orderID;
    String customerID;
    String phoneNumber;
    String orderDate;
    double total;
    String address;

    public Order() {
    }

    public Order(int orderID, String customerID, String phoneNumber, String orderDate, double total, String address) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.total = total;
        this.address = address;
    }
    
    public Order(String customerID, String phoneNumber, String orderDate, double total, String address) {
        this.customerID = customerID;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.total = total;
        this.address = address;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
