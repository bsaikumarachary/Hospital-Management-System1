<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Patient Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="auth-container glass-card fade-in" style="max-width: 500px; margin-top: 50px;">
        <h2 class="gradient-text" style="text-align: center;">Patient Registration</h2>
        <p style="text-align: center; color: var(--text-muted); margin-bottom: 30px;">Create your health account</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="register" method="post">
            <h3 style="font-size: 0.9rem; color: var(--primary); margin-bottom: 15px; border-bottom: 1px solid var(--glass-border); padding-bottom: 5px;">Account Credentials</h3>
            <div style="display: flex; gap: 20px;">
                <div class="form-group" style="flex: 1;">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="User-ID">
                </div>
                <div class="form-group" style="flex: 1;">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="••••••••">
                </div>
            </div>

            <h3 style="font-size: 0.9rem; color: var(--secondary); margin: 20px 0 15px 0; border-bottom: 1px solid var(--glass-border); padding-bottom: 5px;">Personal Information</h3>
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="John Doe">
            </div>

            <div style="display: flex; gap: 20px;">
                <div class="form-group" style="flex: 1;">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" required placeholder="0">
                </div>
                <div class="form-group" style="flex: 1;">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" required placeholder="1234567890">
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required placeholder="123 Main St, City">
            </div>

            <div style="display: flex; gap: 10px; margin-top: 20px;">
                <button type="submit" style="flex: 2;">Register Account</button>
                <a href="index.jsp" style="flex: 1; text-decoration: none; text-align: center; padding: 14px; background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border); border-radius: 12px; color: var(--text-muted); font-weight: 600;">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
