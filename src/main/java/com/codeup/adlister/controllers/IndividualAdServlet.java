package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.IndividualAdServlet", urlPatterns = "/ad")
public class IndividualAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id") != null){
            long id = Long.parseLong(request.getParameter("id"));
            if(DaoFactory.getAdsDao().findAdById(id) != null) {
                request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(id));
                request.getRequestDispatcher("/WEB-INF/ads/individualAd.jsp")
                        .forward(request, response);
                return;
            }
            response.sendRedirect("/ads");
        }
    }
}