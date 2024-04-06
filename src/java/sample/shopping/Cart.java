    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TANHUNG
 */
public class Cart {

//    private Map<String, Clothes> cart;
    private Map<String, Product> cart;

    public Cart() {
    }

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

//    public void add(Clothes clothes) {
//        if (this.cart == null) {
//            this.cart = new HashMap<>();
//        }
//        if (this.cart.containsKey(clothes.getId())) {
//            int currentQuantity = this.cart.get(clothes.getId()).getQuantity();
//            clothes.setQuantity(currentQuantity + clothes.getQuantity());
//        }
//        this.cart.put(clothes.getId(), clothes);
//    }
    public void add(Product product) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getId())) {
            int currentQuantity = this.cart.get(product.getId()).getQuantity();
            product.setQuantity(currentQuantity + product.getQuantity());
        }
        this.cart.put(product.getId(), product);
    }

//    public boolean edit(String id, Clothes clothes) {
//        boolean checkEdit = false;
//        try {
//            if (this.cart != null) {
//                if (this.cart.containsKey(id)) {
//                    this.cart.replace(id, clothes);
//                    checkEdit =true;
//                }
//            }
//        } catch (Exception e) {
//        }
//        return checkEdit;
//    }
    public boolean edit(String id, Product product) {
        boolean checkEdit = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, product);
                    checkEdit =true;
                }
            }
        } catch (Exception e) {
        }
        return checkEdit;
    }
    
     public boolean remove(String id) {
        boolean checkEdit = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    checkEdit =true;
                }
            }
        } catch (Exception e) {
        }
        return checkEdit;
    }

}
