<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Manage Appointments</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="dashboard-container fade-in">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2 class="gradient-text">Manage Appointments</h2>
            <a href="appointments?action=new" class="button" style="text-decoration: none; padding: 10px 20px; background: var(--primary); border-radius: 8px; color: white;">Book Appointment</a>
        </div>
        
        <div class="glass-card table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Patient</th>
                        <th>Doctor</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${listAppointment}">
                        <tr>
                            <td><c:out value="${app.id}" /></td>
                            <td style="font-weight: 600;"><c:out value="${app.patientName}" /></td>
                            <td><c:out value="${app.doctorName}" /></td>
                            <td><c:out value="${app.appointmentDate}" /></td>
                            <td><c:out value="${app.appointmentTime}" /></td>
                            <td>
                                <span class="badge ${app.status == 'SCHEDULED' ? 'badge-warning' : (app.status == 'COMPLETED' ? 'badge-success' : 'badge-danger')}">
                                    <c:out value="${app.status}" />
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 5px;">
                                    <a href="appointments?action=updateStatus&id=${app.id}&status=COMPLETED" class="action-btn btn-edit" style="background: rgba(16, 185, 129, 0.2); color: #10b981;">Complete</a>
                                    <a href="appointments?action=updateStatus&id=${app.id}&status=CANCELLED" class="action-btn btn-delete">Cancel</a>
                                    <a href="appointments?action=delete&id=${app.id}" class="action-btn" style="background: rgba(255,255,255,0.05); color: var(--text-muted); border: 1px solid var(--glass-border);" onclick="return confirm('Delete this record?')">X</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
