package com.example.assignment.repository;

import com.example.assignment.entity.KhachHang;
import com.example.assignment.entity.SanPham;
import com.example.assignment.util.HibernateUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class KhachHangRepository {
    public ArrayList<KhachHang> getAll() {
        ArrayList<KhachHang> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            ds = (ArrayList<KhachHang>) session.createQuery("from KhachHang as kh order by kh.ma asc").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }

    public KhachHang getById(String id) {
        KhachHang khachHang = new KhachHang();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from KhachHang where id =: id");
            query.setParameter("id", id);
            khachHang = (KhachHang) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return khachHang;
    }
    public ArrayList<KhachHang> getPage(ArrayList<KhachHang> lists, int start, int end){
        ArrayList<KhachHang> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(lists.get(i));
        }
        return list;
    }

    public void addOrUpdate(KhachHang khachHang){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
           session.saveOrUpdate(khachHang);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void delete(KhachHang kh){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.delete(kh);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
KhachHangRepository kr = new KhachHangRepository();
KhachHang kh = kr.getById("782b9c2d-f825-a44b-b4ed-bbcc8243a0d0");
kr.delete(kh);
    }

}
