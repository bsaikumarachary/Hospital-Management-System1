<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="dashboard-container fade-in">
        <h2 class="gradient-text">Admin Dashboard</h2>
        <p style="color: var(--text-muted);">Welcome to the Hospital Management System administration portal.</p>
        
        <div class="grid">
            <div class="glass-card stat-card">
                <h3>Quick Actions</h3>
                <div style="margin-top: 20px; display: flex; flex-direction: column; gap: 10px;">
                    <a href="doctors?action=new" class="button" style="text-decoration: none; text-align: center; display: block; padding: 12px; background: var(--primary); border-radius: 10px; color: white;">Add New Doctor</a>
                    <a href="patients?action=new" class="button" style="text-decoration: none; text-align: center; display: block; padding: 12px; background: var(--secondary); border-radius: 10px; color: white;">Add New Patient</a>
                </div>
            </div>
            
            <div class="glass-card stat-card">
                <h3>Management</h3>
                <div style="margin-top: 20px; display: flex; flex-direction: column; gap: 10px;">
                    <a href="doctors?action=list" class="nav-link" style="padding: 10px; border: 1px solid var(--glass-border); border-radius: 8px; display: block;">View All Doctors</a>
                    <a href="patients?action=list" class="nav-link" style="padding: 10px; border: 1px solid var(--glass-border); border-radius: 8px; display: block;">View All Patients</a>
                </div>
            </div>
            
            <div class="glass-card stat-card">
                <h3>System Status</h3>
                <div class="value" style="color: var(--success);">Online</div>
                <p style="font-size: 0.8rem; color: var(--text-muted);">Database connection active</p>
            </div>
        </div>
    </div>
</body>
</html>
