<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Manage Patients</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="dashboard-container fade-in">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2 class="gradient-text">Manage Patients</h2>
            <a href="patients?action=new" class="button" style="text-decoration: none; padding: 10px 20px; background: var(--secondary); border-radius: 8px; color: white;">Add New Patient</a>
        </div>
        
        <div class="glass-card table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="patient" items="${listPatient}">
                        <tr>
                            <td><c:out value="${patient.id}" /></td>
                            <td style="font-weight: 600;"><c:out value="${patient.name}" /></td>
                            <td><c:out value="${patient.age}" /></td>
                            <td><span class="badge badge-warning"><c:out value="${patient.gender}" /></span></td>
                            <td><c:out value="${patient.phone}" /></td>
                            <td>
                                <a href="patients?action=edit&id=<c:out value='${patient.id}' />" class="action-btn btn-edit">Edit</a>
                                <a href="patients?action=delete&id=<c:out value='${patient.id}' />" class="action-btn btn-delete" onclick="return confirm('Are you sure you want to delete this patient?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
