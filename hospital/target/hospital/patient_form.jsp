<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | <c:if test="${patient != null}">Edit</c:if><c:if test="${patient == null}">Add</c:if> Patient</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="auth-container glass-card fade-in" style="margin-top: 50px;">
        <h2 class="gradient-text" style="text-align: center;">
            <c:if test="${patient != null}">Edit Patient</c:if>
            <c:if test="${patient == null}">Add New Patient</c:if>
        </h2>
        
        <form action="patients" method="post">
            <input type="hidden" name="action" value="<c:if test='${patient != null}'>update</c:if><c:if test='${patient == null}'>insert</c:if>">
            <c:if test="${patient != null}">
                <input type="hidden" name="id" value="<c:out value='${patient.id}' />">
            </c:if>
            
            <div class="form-group">
                <label for="name">Patient Name</label>
                <input type="text" id="name" name="name" value="<c:out value='${patient.name}' />" required placeholder="Full Name">
            </div>
            
            <div style="display: flex; gap: 20px;">
                <div class="form-group" style="flex: 1;">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" value="<c:out value='${patient.age}' />" required placeholder="0">
                </div>
                <div class="form-group" style="flex: 1;">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" <c:if test="${patient.gender == 'Male'}">selected</c:if>>Male</option>
                        <option value="Female" <c:if test="${patient.gender == 'Female'}">selected</c:if>>Female</option>
                        <option value="Other" <c:if test="${patient.gender == 'Other'}">selected</c:if>>Other</option>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" value="<c:out value='${patient.phone}' />" placeholder="1234567890">
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" value="<c:out value='${patient.address}' />" placeholder="123 Main St, City">
            </div>
            
            <div style="display: flex; gap: 10px;">
                <button type="submit" style="flex: 2;"><c:if test="${patient != null}">Update</c:if><c:if test="${patient == null}">Save</c:if></button>
                <a href="patients?action=list" style="flex: 1; text-decoration: none; text-align: center; padding: 14px; background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border); border-radius: 12px; color: var(--text-muted); font-weight: 600;">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
