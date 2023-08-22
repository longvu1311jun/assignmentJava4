package com.example.assignment.repository;

import com.example.assignment.entity.ChiTietSP;
import com.example.assignment.entity.KhachHang;
import com.example.assignment.entity.NhanVien;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;

public class NhanVienRepository {
    public ArrayList<NhanVien> getAll() {
        ArrayList<NhanVien> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            ds = (ArrayList<NhanVien>) session.createQuery("from NhanVien").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }
    public NhanVien checkNV(String sdt, String matKhau){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Query query = session.createQuery("from NhanVien where sdt =: sdt and matKhau =: matKhau");
            query.setParameter("sdt", sdt);
            query.setParameter("matKhau", matKhau);
            NhanVien nv = (NhanVien) query.getSingleResult();
            return nv;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        NhanVienRepository nr = new NhanVienRepository();
        System.out.println(nr.checkNV("0988123456","123a"));
    }
}
