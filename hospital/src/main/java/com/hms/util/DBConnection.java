package com.hms.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBConnection {
    private static final String URL = "jdbc:h2:mem:hospital_db;DB_CLOSE_DELAY=-1;MODE=MySQL";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("org.h2.Driver");
            initializeDatabase();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void initializeDatabase() {
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             InputStream is = DBConnection.class.getClassLoader().getResourceAsStream("/schema.sql");
             Scanner scanner = new Scanner(is == null ? new java.io.FileInputStream("c:/Users/subud/OneDrive/Desktop/hospital/schema.sql") : is)) {
            
            scanner.useDelimiter(";");
            try (Statement stmt = conn.createStatement()) {
                while (scanner.hasNext()) {
                    String sql = scanner.next().trim();
                    if (!sql.isEmpty()) {
                        stmt.execute(sql);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Wait: " + e.getMessage());
            // If resource stream fails, try relative path or assume schema already exists
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
