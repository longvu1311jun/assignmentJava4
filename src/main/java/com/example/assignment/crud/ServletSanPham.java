package com.example.assignment.crud;

import com.example.assignment.entity.*;
import com.example.assignment.repository.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ServletSanPham", value = {"/SanPham/qlsp", "/spAdd",
        "/spDetail", "/spUpdate", "/sanpham/deleteSP","/editSP"})
public class ServletSanPham extends HttpServlet {
    CTSPRepository ctr = new CTSPRepository();
    SanPhamRepository spr = new SanPhamRepository();
    NSXRepository nsx = new NSXRepository();
    MauSacRepository color = new MauSacRepository();
    DongSPRepository dongSP = new DongSPRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("qlsp")) {
            String ten = request.getParameter("cid");
            ArrayList<ChiTietSP> ds = new ArrayList<>();
            if(ten!=null){
                ds=ctr.getByTen(ten);
            }else {
                ds= ctr.getAll();
            }
            int page, numberPage = 5;
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
            ArrayList<ChiTietSP> listPage = ctr.getPage(ds, start, end);
            request.setAttribute("chid",ten);
            request.setAttribute("ds", listPage);
            request.setAttribute("nsx", nsx.getAll());
            request.setAttribute("color", color.getAll());
            request.setAttribute("type", dongSP.getAll());
            request.setAttribute("type1", dongSP.getAll());
            request.setAttribute("sanP", spr.getAll());
            request.setAttribute("number", number);
            request.setAttribute("page", page);
            request.getRequestDispatcher("/crud/SanPham.jsp").forward(request, response);
        } else if (url.contains("spDetail")) {
            String id = request.getParameter("id");
            request.setAttribute("pr", ctr.getById(id));
            request.setAttribute("nsx", nsx.getAll());
            request.setAttribute("color", color.getAll());
            request.setAttribute("type", dongSP.getAll());
            request.setAttribute("sanP", spr.getAll());
            request.getRequestDispatcher("/crud/DetailSP.jsp").forward(request, response);
        }else if (url.contains("deleteSP")) {
            String id = request.getParameter("id");
            ctr.delete(ctr.getById(id));
            response.sendRedirect("/SanPham/qlsp");
        }else if (url.contains("editSP")) {
            response.sendRedirect("/product/show");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        ChiTietSP ct = new ChiTietSP();
        SanPham sp = new SanPham();
        MauSac mauSac = new MauSac();
        DongSP dSP = new DongSP();
        NSX sx = new NSX();
        try {
            BeanUtils.populate(ct, request.getParameterMap());
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
                ct.setSanPham(sp);
        String idMau = request.getParameter("color");
        String idDong = request.getParameter("dsp");
        String idNsx = request.getParameter("sx");
        String idSP = request.getParameter("sPham");
        mauSac = color.getById(idMau);
        dSP = dongSP.getById(idDong);
        sx = nsx.getById(idNsx);
        sp = spr.getById(idSP);
        ct.setMauSac(mauSac);
        ct.setNsx(sx);
        ct.setDongSP(dSP);
        ct.setSanPham(sp);
        if (url.contains("spAdd")) {
            ct.setId(UUID.randomUUID().toString());
            ctr.addOrUpdate(ct);
        } else if (url.contains("spUpdate")) {
            String id = request.getParameter("id");
            System.out.println(id);
            ct.setId(id);
            System.out.println("update sc");
            ctr.addOrUpdate(ct);
        }
        response.sendRedirect("/SanPham/qlsp");
    }
}

