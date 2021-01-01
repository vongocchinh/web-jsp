package model.admin;

import java.util.HashMap;
import java.util.Map;


public class Cart {
 
    private HashMap<Integer, Item> cartItems;
 
    public Cart() {
        cartItems = new HashMap<>();
    }
 
    public Cart(HashMap<Integer, Item> cartItems) {
        this.cartItems = cartItems;
    }
 
    public HashMap<Integer, Item> getCartItems() {
        return cartItems;
    }
 
    public void setCartItems(HashMap<Integer, Item> cartItems) {
        this.cartItems = cartItems;
    }
    
    public void insertToCart(int key, Item item) {
       boolean bln = cartItems.containsKey(key);
       if (bln) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItems.put(item.getProduct().getProductID(), item);
       } else {
            cartItems.put(item.getProduct().getProductID(), item);
       }
}
    public void plusToCart(int key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }
   
    public void subToCart(int key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            if (quantity_old <= 1) {
                cartItems.remove(key);
            } else {
                item.setQuantity(quantity_old - 1);
                cartItems.put(key, item);
            }
        }
    }

   
    public void removeToCart(Integer key) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }
    
    
    public int countItem() {
        return cartItems.entrySet().size();
    }

    
    public int totalCart() {
        int count = 0;
       
        for (Map.Entry<Integer, Item> list : cartItems.entrySet()) {
        	int giasale=(int)Integer.parseInt(list.getValue().getProduct().getGiam_Gia());
        	int giagoc=list.getValue().getProduct().getProductPrice();
        	float sale2=(float) giasale/100;
        	float giacon=(float) giagoc-(giagoc*sale2);
            count +=(float) giacon* list.getValue().getQuantity();
        }
        return count;
    }
    public String sp() {
        String count ="";
       
        for (Map.Entry<Integer, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getProductName()+"("+list.getValue().getQuantity()+"sp)"+"<br>";
        }
        return count;
    }
    public int totalCart2() {
        int count = 0;
       
        for (Map.Entry<Integer, Item> list : cartItems.entrySet()) {
            count +=list.getValue().getQuantity();
        }
        return count;
    }
 
}
