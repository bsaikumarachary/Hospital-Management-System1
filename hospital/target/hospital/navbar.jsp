<%@ page import="com.hms.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<nav class="navbar">
    <div class="logo gradient-text">HMS</div>
    <div class="nav-links">
        <% if ("ADMIN".equals(currentUser.getRole())) { %>
            <a href="admin_dashboard.jsp" class="nav-link">Dashboard</a>
            <a href="doctors?action=list" class="nav-link">Doctors</a>
            <a href="patients?action=list" class="nav-link">Patients</a>
        <% } else if ("RECEPTIONIST".equals(currentUser.getRole())) { %>
            <a href="receptionist_dashboard.jsp" class="nav-link">Dashboard</a>
            <a href="appointments?action=list" class="nav-link">Appointments</a>
        <% } else if ("PATIENT".equals(currentUser.getRole())) { %>
            <a href="patient_dashboard.jsp" class="nav-link">My Panel</a>
        <% } %>
        <a href="logout" class="nav-link" style="color: var(--error);">Logout</a>
    </div>
    <div class="user-info" style="font-size: 0.8rem; color: var(--text-muted);">
        Logged in as: <span style="color: var(--foreground); font-weight: 600;"><%= currentUser.getUsername() %></span>
    </div>
</nav>
