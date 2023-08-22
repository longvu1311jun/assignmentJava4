package com.example.assignment.crud;

import com.example.assignment.entity.DongSP;
import com.example.assignment.entity.MauSac;
import com.example.assignment.repository.MauSacRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ServletMS", value = {"/mauSac/showcl","/mausac/ProAdd",
"/mausac/ProUpdate","/mausac/detail","/mausac/delete"})
public class ServletMauSac extends HttpServlet {
    MauSacRepository sr = new MauSacRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("showcl")) {
            ArrayList<MauSac> ds = sr.getAll();
            request.setAttribute("ds", ds);
            System.out.println("show");
            request.getRequestDispatcher("/crud/mauSac.jsp").forward(request, response);
        } else if (url.contains("/mausac/detail")) {
            String id = request.getParameter("id");
            MauSac sp = sr.getById(id);
            request.setAttribute("sp", sp);
            request.getRequestDispatcher("/crud/detailColor.jsp").forward(request, response);
        }else if (url.contains("/mausac/delete")) {
            String id = request.getParameter("id");
            sr.delete(sr.getById(id));
            response.sendRedirect("/mauSac/showcl");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        MauSac sp = new MauSac();
        try {
            BeanUtils.populate(sp, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (url.contains("/mausac/ProAdd")) {
            sp.setId(UUID.randomUUID().toString());
            sr.addOrUpdate(sp);
        } else if (url.contains("/mausac/ProUpdate")) {
            sr.addOrUpdate(sp);
        }
        response.sendRedirect("/mauSac/showcl");
    }
}
