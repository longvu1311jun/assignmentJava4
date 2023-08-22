package com.example.assignment.repository;

import com.example.assignment.entity.NSX;
import com.example.assignment.entity.NSX;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;

public class NSXRepository {
    public ArrayList<NSX> getAll() {
        ArrayList<NSX> ds = new ArrayList<>();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            ds = (ArrayList<NSX>) session.createQuery("from NSX").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ds;
    }
    public void addOrUpdate(NSX sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.saveOrUpdate(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void delete(NSX sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.delete(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public NSX getById(String id) {
        NSX nsx = new NSX();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from NSX where id =: id");
            query.setParameter("id", id);
            nsx = (NSX) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nsx;
    }
}
