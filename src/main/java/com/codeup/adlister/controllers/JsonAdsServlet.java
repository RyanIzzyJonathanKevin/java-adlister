package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "controllers.JsonAdsServlet", urlPatterns = "/ads/ajax")
public class JsonAdsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String json = "";

        if (request.getParameter("id") != null) {
            Ad ad = DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("id")));
            json = new Gson().toJson(ad, ad.getClass());
        } else {
            List<Ad> ads = DaoFactory.getAdsDao().all();
            json = new Gson().toJson(ads, ads.getClass());
        }

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(json);
        out.flush();
    }
}
