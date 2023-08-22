package com.example.assignment.servlet;


import com.example.assignment.entity.Cart;
import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.ChiTietSP;
import com.example.assignment.entity.SanPham;
import com.example.assignment.repository.CTSPRepository;
import com.example.assignment.repository.SanPhamRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletCart", value = {"/addToCart"})
public class ServletCart extends HttpServlet {
    CTSPRepository ctsp = new CTSPRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CartItem> ds = new ArrayList<>();
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        ChiTietSP sanPham = ctsp.getById(id);
        CartItem cartItem = new CartItem();
        cartItem.setSp(sanPham);
        cartItem.setTenSp(sanPham.getSanPham().getTen());
        cartItem.setGiaBan(sanPham.getGiaBan().intValue());
        cartItem.setSoLuong(1);
        Cart cart = new Cart();
        cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            Cart cartTmp = new Cart();
            List<CartItem> listCartItem = new ArrayList<>();
            listCartItem.add(cartItem);
            cartTmp.setList(listCartItem);
            session.setAttribute("cart", cartTmp);
            ds = listCartItem;
        }   else {
            List<CartItem> list = cart.getList();
            boolean check =false;
            for (CartItem c:list) {
                if(c.getSp().getId().equals(cartItem.getSp().getId())){
                    c.setSoLuong(c.getSoLuong()+1);
                    check=true;
                }
            }
            if(check==false) {
                list.add(cartItem);
            }
            cart.setList(list);
            session.setAttribute("cart", cart);
            ds = cart.getList();
        }
        if (cart != null) {
            ds = cart.getList();
        }
        session.setAttribute("ds",ds);
        String url = request.getRequestURI();
        if (url.contains("addToCart")) {
            String id1 = request.getParameter("id");
            ChiTietSP sp = ctsp.getById(id1);
            request.setAttribute("sp",sp);
//            request.getRequestDispatcher("/view/detail.jsp").forward(request,response);
      response.sendRedirect("/detailSP?id="+id1);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
