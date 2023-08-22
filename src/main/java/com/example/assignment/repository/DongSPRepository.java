package com.example.assignment.repository;

import com.example.assignment.entity.DongSP;
import com.example.assignment.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;

public class DongSPRepository {
        public ArrayList<DongSP> getAll() {
            ArrayList<DongSP> ds = new ArrayList<>();
            try (Session session = HibernateUtil.getFACTORY().openSession()) {
                ds = (ArrayList<DongSP>) session.createQuery("from DongSP as sp order by sp.ten asc").list();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return ds;
        }
        public void addOrUpdate(DongSP sp){
            try (Session session = HibernateUtil.getFACTORY().openSession()){
                Transaction transaction = null;
                transaction = session.beginTransaction();
                session.saveOrUpdate(sp);
                transaction.commit();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    public void delete(DongSP sp){
        try (Session session = HibernateUtil.getFACTORY().openSession()){
            Transaction transaction = null;
            transaction = session.beginTransaction();
            session.delete(sp);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public DongSP getById(String id) {
        DongSP DongSP = new DongSP();
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            Query query = session.createQuery("from DongSP where id =: id");
            query.setParameter("id", id);
            DongSP = (DongSP) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return DongSP;
    }
}
