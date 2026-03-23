<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Manage Doctors</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="dashboard-container fade-in">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2 class="gradient-text">Manage Doctors</h2>
            <a href="doctors?action=new" class="button" style="text-decoration: none; padding: 10px 20px; background: var(--primary); border-radius: 8px; color: white;">Add New Doctor</a>
        </div>
        
        <div class="glass-card table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Specialization</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="doctor" items="${listDoctor}">
                        <tr>
                            <td><c:out value="${doctor.id}" /></td>
                            <td style="font-weight: 600;"><c:out value="${doctor.name}" /></td>
                            <td><span class="badge badge-success"><c:out value="${doctor.specialization}" /></span></td>
                            <td><c:out value="${doctor.phone}" /></td>
                            <td><c:out value="${doctor.email}" /></td>
                            <td>
                                <a href="doctors?action=edit&id=<c:out value='${doctor.id}' />" class="action-btn btn-edit">Edit</a>
                                <a href="doctors?action=delete&id=<c:out value='${doctor.id}' />" class="action-btn btn-delete" onclick="return confirm('Are you sure you want to delete this doctor?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
