package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> findAdsbySearch(String search) {
        // Add %s to searchterm
        search = "%" + search + "%";

        try{
            // Prepare statment
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?");
            // Add search to query
            stmt.setString(1,search);
            stmt.setString(2,search);

            // Execute
            ResultSet rs = stmt.executeQuery();

            // Create ads and return
            return createAdsFromResults(rs);
        } catch (SQLException e){
            throw  new RuntimeException("Error finding ad by searchterm", e);
        }
    }

    @Override
    public List<Ad> findAdsbyUserId(long id) {
        try{
            // Prepare statement
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");

            // Add id
            stmt.setLong(1,id);

            // Execute
            ResultSet rs = stmt.executeQuery();

            // Create and return ads
            return createAdsFromResults(rs);
        }catch (SQLException e){
            throw new RuntimeException("Error finding ads by User Id", e);
        }
    }

    @Override
    public Long editAd(Ad ad) {
        try {
            // Query
            String query = "UPDATE ads SET title = ?, description = ?, WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            // Add information
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getId());

            // Execute
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            // Return row updated
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error editing ad by id", e);
        }
    }

    @Override
    public Long deleteAd(long id) {
        try {
            // Query
            String query = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            // Add id
            stmt.setLong(1, id);

            // Execute
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            // Return row deleted
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error editing ad by id", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
