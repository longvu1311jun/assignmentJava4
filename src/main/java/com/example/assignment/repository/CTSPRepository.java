package com.example.assignment.repository;

import com.example.assignment.entity.*;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.w3c.dom.ls.LSOutput;

import java.math.BigDecimal;
import java.util.ArrayList;

public class CTSPRepository {
    public ArrayList<ChiTietSP> getAll() {
        ArrayList<ChiTietSP> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            ds = (ArrayList<ChiTietSP>) session.createQuery("from ChiTietSP").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }


    public ArrayList<ChiTietSP> getPage(ArrayList<ChiTietSP> lists, int start, int end){
        ArrayList<ChiTietSP> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(lists.get(i));
        }
        return list;
    }
    public void addOrUpdate(ChiTietSP ct){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.saveOrUpdate(ct);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public ChiTietSP getById(String id) {
        ChiTietSP sp = new ChiTietSP();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from ChiTietSP where id =: id");
            query.setParameter("id", id);
            sp = (ChiTietSP) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sp;
    }
    public ArrayList<ChiTietSP> getByType(String dong) {
        ArrayList<ChiTietSP> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query= session.createQuery(" from ChiTietSP as sp " +
            "inner join  DongSP as  d on sp.dongSP.id=d.id and d.ten=: dong");
            query.setParameter("dong", dong);
            ds = (ArrayList<ChiTietSP>) query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }

    public ArrayList<ChiTietSP> getByTen(String ten) {
        ArrayList<ChiTietSP> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query= session.createQuery(" from ChiTietSP as sp  where sp.dongSP.ten = :ten");
            query.setParameter("ten", ten);
            ds = (ArrayList<ChiTietSP>) query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }
    public void delete(ChiTietSP sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.remove(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        CTSPRepository kr = new CTSPRepository();
//        System.out.println(kr.getById("1d44bfc9-5ac9-e742-9d48-96e2b919192c"));
        System.out.println(kr.getByType("MacBook").toString());
//        System.out.println(kr.getAll().toString());
    }

}
