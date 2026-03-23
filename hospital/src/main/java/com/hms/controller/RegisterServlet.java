package com.hms.controller;

import com.hms.util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // 1. Insert into users table
            String userQuery = "INSERT INTO users (username, password, role) VALUES (?, ?, 'PATIENT')";
            int userId = -1;
            try (PreparedStatement ps = conn.prepareStatement(userQuery, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.executeUpdate();
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) userId = rs.getInt(1);
                }
            }

            // 2. Insert into patients table
            String patientQuery = "INSERT INTO patients (name, age, gender, phone, address, user_id) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(patientQuery)) {
                ps.setString(1, name);
                ps.setInt(2, age);
                ps.setString(3, gender);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setInt(6, userId);
                ps.executeUpdate();
            }

            conn.commit();
            request.setAttribute("success", "Registration successful! You can now login.");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (SQLException e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            e.printStackTrace();
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
