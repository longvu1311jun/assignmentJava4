package com.example.assignment.servlet;

import com.example.assignment.entity.DongSP;
import com.example.assignment.repository.DongSPRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletFilter", value = "/home1")
public class ServletFilter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DongSPRepository d = new DongSPRepository();
        ArrayList<DongSP> list = d.getAll();
        boolean[] chid = new boolean[list.size()+1];
        chid[0]=true;
        request.setAttribute("data",list);
        request.setAttribute("cid",0);
        request.setAttribute("chid",chid);
        System.out.println(list.size());
        request.getRequestDispatcher("/view/Shop_page.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
