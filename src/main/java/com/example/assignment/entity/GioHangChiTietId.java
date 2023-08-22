package com.example.assignment.entity;

import java.io.Serializable;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GioHangChiTietId implements Serializable{
    
    private String IdGioHang;
    
    private String IdChiTietSP;
}
