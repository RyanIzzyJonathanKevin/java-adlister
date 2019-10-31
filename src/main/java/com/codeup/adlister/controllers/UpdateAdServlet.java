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
                request.setAttribute("categories", DaoFactory.getCategoriesDao().findCategory(id));
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
            User user = (User) request.getSession().getAttribute("user");
        if(request.getParameter("title") != null && request.getParameter("description") != null && request.getParameterValues("categoryCheckbox") != null) {
            Ad ad = new Ad(
                    longId,
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    Arrays.asList(request.getParameterValues("categoryCheckbox"))
            );

            DaoFactory.getCategoriesDao().deleteCategories(longId);
            DaoFactory.getAdsDao().editAd(ad);
            DaoFactory.getCategoriesDao().insert(longId, ad);
            response.sendRedirect("/profile");

            request.getSession().setAttribute("error", null);


        } else {
            request.getSession().setAttribute("error", "Please fill in all required fields");
            response.sendRedirect("/ads/update?id=" + id);
        }

    }
}