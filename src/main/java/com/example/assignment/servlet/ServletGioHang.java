package com.example.assignment.servlet;

import com.example.assignment.entity.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletGioHang", value = {"/giohang","/remove","/updateGH"})
public class ServletGioHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        List<CartItem> ds = new ArrayList<>();
        boolean check =false;
        if(ds.size()>0){
            check=true;
        }
        HttpSession session = request.getSession();
        ds = (List<CartItem>) session.getAttribute("ds");
        int total=0;
        if (url.contains("giohang")) {
           if(ds!=null){
               for (CartItem c:ds) {
                   total += (c.getGiaBan()*c.getSoLuong());
               }
           }
            request.setAttribute("total",total);
            request.setAttribute("cartList", ds);
    request.getRequestDispatcher("/view/GioHang.jsp").forward(request,response);
        } else if (url.contains("remove")) {
            String id = request.getParameter("id");
            CartItem cart = new CartItem();
            for (CartItem c: ds) {
                if (c.getSp().getId().equals(id)){
                    cart = c;
                }
            }
            ds.remove(cart);
            response.sendRedirect("giohang");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url= request.getRequestURI();
    String id = request.getParameter("id");
    String soLuong = request.getParameter("soLuong");
        List<CartItem> ds = new ArrayList<>();
        HttpSession session = request.getSession();
        ds = (List<CartItem>) session.getAttribute("ds");
    if (url.contains("/updateGH")){
        for (CartItem c: ds) {
            if (c.getSp().getId().equals(id)){
                c.setSoLuong(Integer.valueOf(soLuong));
            }
        }
        response.sendRedirect("/giohang");
    }
    }
}
