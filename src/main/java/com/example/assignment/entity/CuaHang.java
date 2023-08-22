package com.example.assignment.entity;

import java.util.UUID;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "CuaHang")
public class CuaHang {

    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;
    
    @Column(name = "DiaChi")
    private String diaChi;
    
    @Column(name = "ThanhPho")
    private String thanhPho;
    
    @Column(name = "QuocGia")
    private String quocGia;

    @Override
    public String toString() {
        return "CuaHang{" +
                "id=" + id +
                ", ma='" + ma + '\'' +
                ", ten='" + ten + '\'' +
                ", diaChi='" + diaChi + '\'' +
                ", thanhPho='" + thanhPho + '\'' +
                ", quocGia='" + quocGia + '\'' +
                '}';
    }
}
