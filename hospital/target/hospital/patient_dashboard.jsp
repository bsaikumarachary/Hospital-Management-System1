<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Patient Panel</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="dashboard-container fade-in">
        <h2 class="gradient-text">Patient Panel</h2>
        <p style="color: var(--text-muted);">Welcome to your personal health portal.</p>
        
        <div class="grid">
            <div class="glass-card stat-card" style="grid-column: span 2;">
                <h3>My Appointments</h3>
                <p style="margin-top: 10px; color: var(--text-muted); font-size: 0.85rem;">Coming soon: Detailed view of your medical history and upcoming visits.</p>
                
                <div class="table-container">
                    <p style="padding: 20px; text-align: center; color: var(--text-muted); border: 1px dashed var(--glass-border); border-radius: 12px; margin-top: 20px;">
                        No upcoming appointments scheduled.
                    </p>
                </div>
            </div>
            
            <div class="glass-card stat-card">
                <h3>Health Profile</h3>
                <div style="margin-top: 20px; display: flex; flex-direction: column; gap: 15px;">
                    <div>
                        <span style="display: block; font-size: 0.75rem; color: var(--text-muted);">Patient Name</span>
                        <span style="font-weight: 600;"><%= currentUser.getUsername() %></span>
                    </div>
                    <div>
                        <span style="display: block; font-size: 0.75rem; color: var(--text-muted);">Status</span>
                        <span class="badge badge-success">Active</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
