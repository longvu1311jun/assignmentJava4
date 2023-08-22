package com.example.assignment.servlet;

import com.example.assignment.entity.ChiTietSP;
import com.example.assignment.entity.DongSP;
import com.example.assignment.repository.CTSPRepository;
import com.example.assignment.repository.DongSPRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ServletHome", value = {"/home","/detailSP","/gioHang"})
public class ServletHome extends HttpServlet {
    CTSPRepository ctsp = new CTSPRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        DongSPRepository d = new DongSPRepository();
        if (url.contains("home")) {
            ArrayList<DongSP> list = d.getAll();
            String ten = request.getParameter("cid");
            request.setAttribute("data",list);
            request.setAttribute("chid",ten);
            ArrayList<ChiTietSP> ds = new ArrayList<>();
            if(ten!=null){
                ds=ctsp.getByTen(ten);
            }else {
                ds= ctsp.getAll();
            }
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
            ArrayList<ChiTietSP> listPage = ctsp.getPage(ds, start, end);
            request.setAttribute("dsSP", listPage);
            request.setAttribute("number", number);
            request.setAttribute("page", page);
            request.getRequestDispatcher("/view/Shop_page.jsp").forward(request, response);
        } else if (url.contains("detailSP")) {
            String id = request.getParameter("id");
            ChiTietSP sp = ctsp.getById(id);
            request.setAttribute("sp",sp);
            request.getRequestDispatcher("/view/detail.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
