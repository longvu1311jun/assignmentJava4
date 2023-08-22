package com.example.assignment.crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletQuanLy", value = {"/quanly"})
public class ServletQuanLy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String url = request.getRequestURI();
if(url.contains("quanly")){
    request.getRequestDispatcher("/crud/quanLy.jsp").forward(request,response);
}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
