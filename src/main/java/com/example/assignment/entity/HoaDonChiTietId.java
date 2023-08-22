package com.example.assignment.entity;

import java.io.Serializable;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonChiTietId implements Serializable{
    
    private String IdHoaDon;
    
    private String IdChiTietSP;
}
