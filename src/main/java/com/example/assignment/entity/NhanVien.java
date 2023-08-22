package com.example.assignment.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;
import jakarta.persistence.*;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "NhanVien")
public class NhanVien {

    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "TenDem")
    private String tenDem;

    @Column(name = "Ho")
    private String ho;

    @Column(name = "GioiTinh")
    private String gioiTinh;

    @Column(name = "NgaySinh")
    private Date ngaySinh;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "Sdt")
    private String sdt;

    @Column(name = "MatKhau")
    private String matKhau;
    
    @ManyToOne
    @JoinColumn(name = "IdCH")
    private CuaHang cuaHang;
    
    @ManyToOne
    @JoinColumn(name = "IdCV")
    private ChucVu chucVu;
    
    @OneToOne
    @JoinColumn(name = "IdGuiBC")
    private NhanVien nhanVien;
    
    @Column(name = "TrangThai")
    private Integer trangThai;

    @Override
    public String toString() {
        return "NhanVien{" +
                "id=" + id +
                ", ma='" + ma + '\'' +
                ", ten='" + ten + '\'' +
                ", tenDem='" + tenDem + '\'' +
                ", ho='" + ho + '\'' +
                ", gioiTinh='" + gioiTinh + '\'' +
                ", ngaySinh=" + ngaySinh +
                ", diaChi='" + diaChi + '\'' +
                ", sdt='" + sdt + '\'' +
                ", matKhau='" + matKhau + '\'' +
                ", cuaHang=" + cuaHang.getTen() +
                ", chucVu=" + chucVu.getTen() +
                ", trangThai=" + trangThai +
                '}';
    }
}
