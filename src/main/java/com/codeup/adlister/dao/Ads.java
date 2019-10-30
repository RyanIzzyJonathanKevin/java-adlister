package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // get current ad
    Ad findAdById(long id);
    // Find ad by title
    List<Ad> findAdsBySearch(String search);
    // Find ads by user id
    List<Ad> findAdsByUserId(long id);
    // Edit ad by id
    void editAd(Ad ad);
    // Delete ad by id
    void deleteAd(long id);
    // Find ads by category
    List<Ad> findAdsByCategory(String category);
}
