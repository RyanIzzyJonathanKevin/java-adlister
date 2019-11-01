package com.codeup.adlister.models;

import java.util.List;

public class Ad {

    private long id;
    private long userId;
    private String title;
    private String description;
    private List<String> categories;
    private double lat;
    private double lon;

    // Default constructor
    public Ad() {
    }
  
    // Constructor for getting from db
    public Ad(long id, long userId, String title, String description, List<String> categories, double lat, double lon) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categories = categories;
        this.lat = lat;
        this.lon = lon;
    }

    // Constructor for create ad servlet
    // No id yet
    public Ad(long userId, String title, String description, List<String> categories, double lat, double lon) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categories = categories;
        this.lat = lat;
        this.lon = lon;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    @Override
    public String toString() {
        return "Ad{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", categories=" + categories +
                ", lat=" + lat +
                ", lon=" + lon +
                '}';
    }
}
