package com.example.assignment.repository;

import com.example.assignment.entity.ChiTietSP;

import java.util.ArrayList;

public class GioHangRepository {
    private ArrayList<ChiTietSP> lists;

    private ChiTietSP getById(String id) {
        for (ChiTietSP sp : lists) {
            if (sp.getId() == id) {
                return sp;
            }
        }
        return null;
    }
}
