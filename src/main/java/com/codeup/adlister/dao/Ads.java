package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // Find ad by title
    List<Ad> findAdsbySearch(String search);
    // Find ads by user id
    List<Ad> findAdsbyUserId(long id);
}
