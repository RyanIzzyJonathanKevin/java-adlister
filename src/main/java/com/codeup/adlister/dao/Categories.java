package com.codeup.adlister.dao;

import java.util.List;

public interface Categories {
    List<String> findCategory(long id);

    long insert(long id, String[] categoriesArray);
}
