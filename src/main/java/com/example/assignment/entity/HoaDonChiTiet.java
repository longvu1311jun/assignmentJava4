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
@Table(name = "HoaDonChiTiet")
@IdClass(HoaDonChiTietId.class)
public class HoaDonChiTiet {

    @Id
    @ManyToOne
    @JoinColumn(name = "IdHoaDon", nullable = false)
    private HoaDon IdHoaDon;

    @Id
    @ManyToOne
    @JoinColumn(name = "IdChiTietSP", nullable = false)
    private ChiTietSP IdChiTietSP;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "DonGia")
    private BigDecimal donGia;
}
