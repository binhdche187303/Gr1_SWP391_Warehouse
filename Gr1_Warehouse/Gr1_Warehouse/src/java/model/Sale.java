/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Sale {

    private int sale_id;
    private Order order;
    private User user;
    private String noteSale;

    public Sale() {
    }

    public Sale(int sale_id, Order order, User user, String noteSale) {
        this.sale_id = sale_id;
        this.order = order;
        this.user = user;
        this.noteSale = noteSale;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getNoteSale() {
        return noteSale;
    }

    public void setNoteSale(String noteSale) {
        this.noteSale = noteSale;
    }

    @Override
    public String toString() {
        return "Sale{" + "sale_id=" + sale_id + ", order=" + order + ", user=" + user.getFullname() + ", noteSale=" + noteSale + '}';
    }

    
    
    
}
