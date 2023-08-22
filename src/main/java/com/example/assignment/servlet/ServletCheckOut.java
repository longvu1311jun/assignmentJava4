package com.example.assignment.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletCheckOut", value = {"/checkOut","/done"})
public class ServletCheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if(url.contains("checkOut")){
            request.getRequestDispatcher("/view/checkOut.jsp").forward(request,response);
        }else if(url.contains("done")){
            HttpSession session = request.getSession();
            session.removeAttribute("ds");
            session.removeAttribute("cart");
            request.getRequestDispatcher("/view/done.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
