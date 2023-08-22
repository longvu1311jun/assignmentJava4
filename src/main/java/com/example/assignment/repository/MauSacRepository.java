package com.example.assignment.repository;

import com.example.assignment.entity.MauSac;
import com.example.assignment.entity.MauSac;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;

public class MauSacRepository {
    public ArrayList<MauSac> getAll() {
        ArrayList<MauSac> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            ds = (ArrayList<MauSac>) session.createQuery("from MauSac").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }
    public void addOrUpdate(MauSac sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.saveOrUpdate(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void delete(MauSac sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.delete(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public MauSac getById(String id) {
        MauSac mauSac = new MauSac();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from MauSac where id =: id");
            query.setParameter("id", id);
            mauSac = (MauSac) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mauSac;
    }
}
