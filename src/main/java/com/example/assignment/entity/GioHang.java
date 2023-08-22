package com.example.assignment.entity;
import java.io.Serializable;
import java.sql.Date;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "GioHang")
public class GioHang implements Serializable{
     @Id
    @Column(name = "Id")
    private String id;

    @ManyToOne
    @JoinColumn(name = "IdKH")
    private KhachHang khachHang;
    
    @ManyToOne
    @JoinColumn(name = "IdNV")
    private NhanVien nhanVien;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "NgayTao")
    private Date ngayTao;

    @Column(name = "NgayThanhToan")
    private Date ngayThanhToan;

    @Column(name = "TenNguoiNhan")
    private String tenNguoiNhan;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "Sdt")
    private String sdt;
    
    @Column(name = "TinhTrang")
    private Integer tinhTrang;

}
