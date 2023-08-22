package com.example.assignment.entity;

import java.io.Serializable;
import java.util.UUID;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "DongSP")
public class DongSP implements Serializable{
    
    @Id
    @Column(name = "Id")
    private String id;
    
    @Column(name = "Ma")
    private String ma;
    
    @Column(name = "Ten")
    private String ten;
}
