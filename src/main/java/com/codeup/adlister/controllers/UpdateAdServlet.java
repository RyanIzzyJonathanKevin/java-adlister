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
import java.util.Arrays;

@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/ads/update")
public class UpdateAdServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id") != null){
           long id = Long.parseLong(request.getParameter("id"));
            if(DaoFactory.getAdsDao().findAdById(id) != null) {
                if (request.getSession().getAttribute("user") != null) {
                    request.setAttribute("user", request.getSession().getAttribute("user"));
                }
                request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(id));
                request.getRequestDispatcher("/WEB-INF/ads/update.jsp")
                        .forward(request, response);
                return;
            }
            response.sendRedirect("/ads");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = (request.getParameter("id"));

        long longId = Long.parseLong(request.getParameter("id"));

        Ad ad = new Ad(
                longId,
                request.getParameter("title"),
                request.getParameter("description"),
                Arrays.asList(request.getParameterValues("categoryCheckbox"))
        );

        DaoFactory.getAdsDao().editAd(ad);
        response.sendRedirect("/ad?id=" + id);

        DaoFactory.getCategoriesDao().deleteCategories(longId);

    }
}