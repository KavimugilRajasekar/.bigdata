package com.retail.app;

public class SalesCalculator {
    public double calculateTotal(double price, int quantity) {
        return price * quantity;
    }

    public String getCategory(double price) {
        if (price > 1000) return "Premium";
        if (price > 100) return "Mid-Range";
        return "Budget";
    }
}
