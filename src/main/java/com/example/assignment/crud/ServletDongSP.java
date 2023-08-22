package com.example.assignment.crud;

import com.example.assignment.entity.DongSP;
import com.example.assignment.repository.DongSPRepository;
import com.example.assignment.repository.DongSPRepository;
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

@WebServlet(name = "ServletDSP", value = {"/dongsp/show","/dongsp/ProAdd",
"/dongsp/ProUpdate","/dongsp/detail","/dongsp/delete"})
public class ServletDongSP extends HttpServlet {
    DongSPRepository sr = new DongSPRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("/dongsp/show")) {
            ArrayList<DongSP> ds = sr.getAll();
            request.setAttribute("ds", ds);
            request.getRequestDispatcher("/crud/DongSP.jsp").forward(request, response);
        } else if (url.contains("/dongsp/detail")) {
            String id = request.getParameter("id");
            DongSP sp = sr.getById(id);
            request.setAttribute("sp", sp);
            request.getRequestDispatcher("/crud/detailCate.jsp").forward(request, response);
        }else if (url.contains("/dongsp/delete")) {
            String id = request.getParameter("id");
            sr.delete(sr.getById(id));
            response.sendRedirect("/dongsp/show");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        DongSP sp = new DongSP();
        try {
            BeanUtils.populate(sp, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (url.contains("/dongsp/ProAdd")) {
            sp.setId(UUID.randomUUID().toString());
            sr.addOrUpdate(sp);
        } else if (url.contains("/dongsp/ProUpdate")) {
            sr.addOrUpdate(sp);
        }
        response.sendRedirect("/dongsp/show");
    }
}
