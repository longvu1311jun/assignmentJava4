package com.example.assignment.repository;

import com.example.assignment.entity.ChiTietSP;
import com.example.assignment.entity.DongSP;
import com.example.assignment.entity.SanPham;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;

public class SanPhamRepository {
        public ArrayList<SanPham> getAll() {
            ArrayList<SanPham> ds = new ArrayList<>();
            try (Session session = HibernateUtil.getFACTORY().openSession()) {
                ds = (ArrayList<SanPham>) session.createQuery("from SanPham as sp order by sp.ten asc").list();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return ds;
        }

        public ArrayList<SanPham> getPage(ArrayList<SanPham> lists, int start, int end){
            ArrayList<SanPham> list = new ArrayList<>();
            for (int i = start; i < end; i++) {
                list.add(lists.get(i));
            }
            return list;
        }
        public void addOrUpdate(SanPham sp){
            try (Session session = HibernateUtil.getFACTORY().openSession()){
                Transaction transaction = null;
                transaction = session.beginTransaction();
                session.saveOrUpdate(sp);
                transaction.commit();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    public void delete(SanPham sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.delete(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public SanPham getById(String id) {
        SanPham sanPham = new SanPham();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from SanPham where id =: id");
            query.setParameter("id", id);
            sanPham = (SanPham) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sanPham;
    }
}
