package com.example.assignment.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "GioHangChiTiet")
@IdClass(GioHangChiTietId.class)
public class GioHangChiTiet {
    
    @Id
    @ManyToOne
    @JoinColumn(name = "IdGioHang", nullable = false)
    private GioHang IdGioHang;

    @Id
    @ManyToOne
    @JoinColumn(name = "IdChiTietSP", nullable = false)
    private ChiTietSP IdChiTietSP;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "DonGia")
    private BigDecimal donGia;
    
    @Column(name = "DonGiaKhiGiam")
    private BigDecimal donGiaKhiGiam;
}
