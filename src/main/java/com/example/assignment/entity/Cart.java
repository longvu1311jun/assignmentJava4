package com.example.assignment.entity;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Cart {
    private List<CartItem> list = new ArrayList<>();

    @Override
    public String toString() {
        return "Cart{" +
                "list=" + list +
                '}';
    }

}
