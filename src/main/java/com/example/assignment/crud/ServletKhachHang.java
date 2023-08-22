package com.example.assignment.crud;

import com.example.assignment.entity.KhachHang;
import com.example.assignment.repository.KhachHangRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "Servlet", value = {"/qlkh"
,"/addKH","/khDetail","/updateKH","/deleteKH"})
public class ServletKhachHang extends HttpServlet {
    KhachHangRepository kr = new KhachHangRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if(url.contains("qlkh")){
            ArrayList<KhachHang> ds = kr.getAll();
            int page, numberPage=6;
            int size = ds.size();
            int number = (size%numberPage==0?(size/numberPage):(size/numberPage)+1);
            String xpage =request.getParameter("page");
            if(xpage == null){
                page=1;
            } else {
                page = Integer.valueOf(xpage);
            }
            int start , end;
            start = (page-1)*numberPage;
            end = Math.min(page*numberPage,ds.size());
            ArrayList<KhachHang> listPage = kr.getPage(ds,start,end);
            request.setAttribute("ds",listPage);
            request.setAttribute("number",number);
            request.setAttribute("page",page);
            request.getRequestDispatcher("/crud/KhachHang.jsp").forward(request, response);
        } else if (url.contains("khDetail")) {
            String id = request.getParameter("id");
            KhachHang kh = kr.getById(id);
            request.setAttribute("khDetail",kh);
            request.getRequestDispatcher("/crud/DetailKH.jsp").forward(request, response);
        } else if (url.contains("deleteKH")) {
            String id = request.getParameter("id");
            KhachHang kh = kr.getById(id);
            kr.delete(kh);
            System.out.println(kh);
    response.sendRedirect("/qlkh");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        KhachHang kh = new KhachHang();
        try {
            BeanUtils.populate(kh, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (url.contains("addKH")) {
            kh.setId(UUID.randomUUID().toString());
            kr.addOrUpdate(kh);
        } else if (url.contains("updateKH")) {
            String id = request.getParameter("id");
           kh.setId(id);
            System.out.println(kh);
            kr.addOrUpdate(kh);
        }
        response.sendRedirect("/qlkh");

    }
}
