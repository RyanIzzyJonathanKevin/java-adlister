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
                    config.getUsername(),
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

            DaoFactory.getCategoriesDao().insert(rs.getLong(1), ad);

            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> findAdsBySearch(String search) {
        // Add %s to searchterm
        search = "%" + search + "%";

        try {
            // Prepare statment
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?");
            // Add search to query
            stmt.setString(1, search);
            stmt.setString(2, search);

            // Execute
            ResultSet rs = stmt.executeQuery();

            // Create ads and return
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ad by searchterm", e);
        }
    }

    @Override
    public List<Ad> findAdsByUserId(long id) {
        try {
            // Prepare statement
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");

            // Add id
            stmt.setLong(1, id);

            // Execute
            ResultSet rs = stmt.executeQuery();

            // Create and return ads
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ads by User Id", e);
        }
    }

    @Override
    public void editAd(Ad ad) {
        try {
            // Query
            String query = "UPDATE ads SET title = ?, description = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            // Add information
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getId());

            // Execute
            stmt.executeUpdate();
            DaoFactory.getCategoriesDao().insert(ad.getId(), ad);

            ResultSet rs = stmt.getGeneratedKeys();

        } catch (SQLException e) {
            throw new RuntimeException("Error editing ad by id", e);
        }
    }

    @Override
    public void deleteAd(long id) {
        try {
            // Query
            String query = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            // Add id
            stmt.setLong(1, id);

            // Delete categories first
            DaoFactory.getCategoriesDao().deleteCategories(id);

            // Execute
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad by id", e);
        }
    }

    @Override
    public List<Ad> findAdsByCategory(String category) {
        try {
            // Query
            String query = "SELECT ads.id, ads.user_id, ads.title, ads.description FROM ads JOIN ad_category ON ads.id = ad_category.ad_id JOIN categories ON ad_category.category_id = categories.id WHERE categories.category = ?";
            PreparedStatement stmt = connection.prepareStatement(query);

            // Add category
            stmt.setString(1, category);

            // Execute
            ResultSet rs = stmt.executeQuery();

            // Return ads
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ads by category", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {

        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
                DaoFactory.getCategoriesDao().findCategory(rs.getLong("id"))

        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
    public Ad findAdById(long id) {
        PreparedStatement ps = null;
        try {
            String insertQuery = "SELECT * FROM ads WHERE id = ?";
            ps = connection.prepareStatement(insertQuery);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if(! rs.next()) {
                return null;
            }
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving current ad.", e);
        }
    }
}
