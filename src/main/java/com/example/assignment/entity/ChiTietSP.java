package com.example.assignment.entity;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import jakarta.persistence.*;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "ChiTietSP")
public class ChiTietSP{
    
    @Id
    @Column(name = "Id")
    private String id;
    
    @ManyToOne
    @JoinColumn(name = "IdSP")
    private SanPham sanPham;
    
    @ManyToOne
    @JoinColumn(name = "IdNsx")
    private NSX nsx;
    
    @ManyToOne
    @JoinColumn(name = "IdMauSac")
    private MauSac mauSac;
    
    @ManyToOne
    @JoinColumn(name = "IdDongSP")
    private DongSP dongSP;
    
    @Column(name = "NamBH")
    private Integer namBH;
    
    @Column(name = "MoTa")
    private String moTa;
    
    @Column(name = "SoLuongTon")
    private Integer soLuongTon;
    
    @Column(name = "GiaNhap")
    private BigDecimal giaNhap;
    
    @Column(name = "GiaBan")
    private BigDecimal giaBan;
    @Column(name = "anhSP")
    private String anhSP;

    public String giaSP(BigDecimal giaBan) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String price = formatter.format(giaBan)+" VNĐ";
        return price;
    }

    @Override
    public String toString() {
        return "ChiTietSP{" +
                "id='" + id + '\'' +
                ", sanPham=" + sanPham +
                ", nsx=" + nsx +
                ", mauSac=" + mauSac +
                ", dongSP=" + dongSP +
                ", namBH=" + namBH +
                ", moTa='" + moTa + '\'' +
                ", soLuongTon=" + soLuongTon +
                ", giaNhap=" + giaNhap +
                ", giaBan=" + giaBan +
                ", anhSP='" + anhSP + '\'' +
                '}';
    }
}
