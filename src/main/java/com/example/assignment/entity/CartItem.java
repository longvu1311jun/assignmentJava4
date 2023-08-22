package com.example.assignment.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    private ChiTietSP sp;

    private Integer giaBan;

    private String tenSp;

    private Integer soLuong;

    @Override
    public String toString() {
        return "CartItem{" +
                "idSp=" + sp +
                ", giaBan=" + giaBan +
                ", tenSp='" + tenSp + '\'' +
                ", soLuong=" + soLuong +
                '}';
    }


}
