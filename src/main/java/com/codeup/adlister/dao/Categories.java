package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Categories {
    List<String> findCategory(long id);

    void insert(long id, Ad ad);

    void deleteCategories(long id);

}
