package com.example.assignment.crud;

import com.example.assignment.entity.MauSac;
import com.example.assignment.entity.NSX;
import com.example.assignment.repository.NSXRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ServletDL", value = {"/dungLuong/showdl","/dungLuong/ProAdd",
        "/dungLuong/ProUpdate","/dungLuong/detail","/dungLuong/delete"})
public class ServletDL extends HttpServlet {
    NSXRepository sx = new NSXRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("showdl")) {
            ArrayList<NSX> ds = sx.getAll();
            request.setAttribute("ds", ds);
            System.out.println("show");
            request.getRequestDispatcher("/crud/DungLuong.jsp").forward(request, response);
        } else if (url.contains("/dungLuong/detail")) {
            String id = request.getParameter("id");
            NSX sp = sx.getById(id);
            request.setAttribute("sp", sp);
            request.getRequestDispatcher("/crud/detailDL.jsp").forward(request, response);
        }else if (url.contains("/dungLuong/delete")) {
            String id = request.getParameter("id");
            sx.delete(sx.getById(id));
            response.sendRedirect("/dungLuong/showdl");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        NSX sp = new NSX();
        try {
            BeanUtils.populate(sp, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (url.contains("/dungLuong/ProAdd")) {
            sp.setId(UUID.randomUUID().toString());
            sx.addOrUpdate(sp);
        } else if (url.contains("/dungLuong/ProUpdate")) {
            sx.addOrUpdate(sp);
        }
        response.sendRedirect("/dungLuong/showdl");
    }
}
