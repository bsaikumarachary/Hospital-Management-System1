<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | <c:if test="${doctor != null}">Edit</c:if><c:if test="${doctor == null}">Add</c:if> Doctor</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="auth-container glass-card fade-in" style="margin-top: 50px;">
        <h2 class="gradient-text" style="text-align: center;">
            <c:if test="${doctor != null}">Edit Doctor</c:if>
            <c:if test="${doctor == null}">Add New Doctor</c:if>
        </h2>
        
        <form action="doctors" method="post">
            <input type="hidden" name="action" value="<c:if test='${doctor != null}'>update</c:if><c:if test='${doctor == null}'>insert</c:if>">
            <c:if test="${doctor != null}">
                <input type="hidden" name="id" value="<c:out value='${doctor.id}' />">
            </c:if>
            
            <div class="form-group">
                <label for="name">Doctor Name</label>
                <input type="text" id="name" name="name" value="<c:out value='${doctor.name}' />" required placeholder="Dr. Full Name">
            </div>
            
            <div class="form-group">
                <label for="specialization">Specialization</label>
                <input type="text" id="specialization" name="specialization" value="<c:out value='${doctor.specialization}' />" required placeholder="Cardiology, etc.">
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" value="<c:out value='${doctor.phone}' />" placeholder="1234567890">
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" value="<c:out value='${doctor.email}' />" placeholder="doctor@hms.com">
            </div>
            
            <div style="display: flex; gap: 10px;">
                <button type="submit" style="flex: 2;"><c:if test="${doctor != null}">Update</c:if><c:if test="${doctor == null}">Save</c:if></button>
                <a href="doctors?action=list" style="flex: 1; text-decoration: none; text-align: center; padding: 14px; background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border); border-radius: 12px; color: var(--text-muted); font-weight: 600;">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
