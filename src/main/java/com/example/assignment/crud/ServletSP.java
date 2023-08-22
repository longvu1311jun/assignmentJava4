package com.example.assignment.crud;

import com.example.assignment.entity.ChiTietSP;
import com.example.assignment.entity.SanPham;
import com.example.assignment.repository.SanPhamRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ServletSP", value = {"/product/show","/product/ProAdd",
"/product/ProUpdate","/product/detail","/product/delete"})
public class ServletSP extends HttpServlet {
    SanPhamRepository sr = new SanPhamRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("show")) {
            ArrayList<SanPham> ds = sr.getAll();
            int page, numberPage = 6;
            int size = ds.size();
            int number = (size % numberPage == 0 ? (size / numberPage) : (size / numberPage) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.valueOf(xpage);
            }
            int start, end;
            start = (page - 1) * numberPage;
            end = Math.min(page * numberPage, ds.size());
            ArrayList<SanPham> listPage = sr.getPage(ds, start, end);
            request.setAttribute("ds", listPage);
            request.setAttribute("number", number);
            request.setAttribute("page", page);
            request.getRequestDispatcher("/crud/product.jsp").forward(request, response);
        } else if (url.contains("detail")) {
            String id = request.getParameter("id");
            SanPham sp = sr.getById(id);
            request.setAttribute("sp", sp);
            request.getRequestDispatcher("/crud/detailPro.jsp").forward(request, response);
        }else if (url.contains("delete")) {
            String id = request.getParameter("id");
            sr.delete(sr.getById(id));
            response.sendRedirect("/product/show");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        SanPham sp = new SanPham();
        try {
            BeanUtils.populate(sp, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (url.contains("ProAdd")) {
            sp.setId(UUID.randomUUID().toString());
            sr.addOrUpdate(sp);
        } else if (url.contains("ProUpdate")) {
            sr.addOrUpdate(sp);
        }
        response.sendRedirect("/product/show");
    }
}
