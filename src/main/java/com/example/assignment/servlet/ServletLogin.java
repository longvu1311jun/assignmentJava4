package com.example.assignment.servlet;

import com.example.assignment.repository.KhachHangRepository;
import com.example.assignment.repository.NhanVienRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/login")
public class ServletLogin extends HttpServlet {
    NhanVienRepository nv = new NhanVienRepository();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("login")) {
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u = request.getParameter("username");
        String p = request.getParameter("password");
         if (nv.checkNV(u, p) != null) {
            response.sendRedirect("/quanly");
        } else {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }
}
