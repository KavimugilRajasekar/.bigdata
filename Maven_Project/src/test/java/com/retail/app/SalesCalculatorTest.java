package com.retail.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class SalesCalculatorTest {
    @Test
    public void testCalculateTotal() {
        SalesCalculator calc = new SalesCalculator();
        assertEquals(1200.0, calc.calculateTotal(1200.0, 1));
        assertEquals(200.0, calc.calculateTotal(100.0, 2));
    }

    @Test
    public void testGetCategory() {
        SalesCalculator calc = new SalesCalculator();
        assertEquals("Premium", calc.getCategory(1500.0));
        assertEquals("Budget", calc.getCategory(50.0));
    }
}
