<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Book Appointment</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="auth-container glass-card fade-in" style="margin-top: 50px;">
        <h2 class="gradient-text" style="text-align: center;">Book Appointment</h2>
        
        <form action="appointments" method="post">
            <input type="hidden" name="action" value="insert">
            
            <div class="form-group">
                <label for="patientId">Select Patient</label>
                <select id="patientId" name="patientId" required>
                    <c:forEach var="p" items="${patients}">
                        <option value="${p.id}">${p.name} (Age: ${p.age})</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="doctorId">Select Doctor</label>
                <select id="doctorId" name="doctorId" required>
                    <c:forEach var="d" items="${doctors}">
                        <option value="${d.id}">${d.name} (${d.specialization})</option>
                    </c:forEach>
                </select>
            </div>
            
            <div style="display: flex; gap: 20px;">
                <div class="form-group" style="flex: 1;">
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label for="time">Time</label>
                    <input type="time" id="time" name="time" required>
                </div>
            </div>
            
            <div style="display: flex; gap: 10px;">
                <button type="submit" style="flex: 2;">Book Appointment</button>
                <a href="appointments?action=list" style="flex: 1; text-decoration: none; text-align: center; padding: 14px; background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border); border-radius: 12px; color: var(--text-muted); font-weight: 600;">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
