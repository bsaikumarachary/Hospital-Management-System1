<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HMS | Gateway</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .roles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 40px;
            width: 100%;
            max-width: 900px;
        }
        .role-card {
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px solid var(--glass-border);
        }
        .role-card:hover {
            border-color: var(--primary);
            background: rgba(59, 130, 246, 0.1) !important;
            transform: translateY(-5px);
        }
        .role-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            display: block;
        }
        .hidden { display: none !important; }
        .back-btn {
            background: none;
            border: none;
            color: var(--text-muted);
            cursor: pointer;
            font-size: 0.9rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 10px;
            border-radius: 8px;
        }
        .back-btn:hover { color: var(--foreground); background: rgba(255,255,255,0.05); }
    </style>
</head>
<body>
    <div class="dashboard-container" style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 100vh;">
        <h1 class="logo gradient-text" style="font-size: 3.5rem; margin-bottom: 10px;">HMS</h1>
        <p style="color: var(--text-muted); font-size: 1.1rem; margin-bottom: 20px;">Hospital Management System Gateway</p>

        <div id="roleSelection" class="roles-grid fade-in">
            <div class="glass-card role-card" onclick="showLogin('Admin')">
                <span class="role-icon">🛡️</span>
                <h3 class="gradient-text">Admin Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">Manage doctors, patients, and system settings.</p>
            </div>
            <div class="glass-card role-card" onclick="showLogin('Receptionist')">
                <span class="role-icon">📅</span>
                <h3 class="gradient-text">Receptionist Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">Handle appointments and patient registration.</p>
            </div>
            <div class="glass-card role-card" onclick="showLogin('Patient')">
                <span class="role-icon">👤</span>
                <h3 class="gradient-text">Patient Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">View your medical history and appointments.</p>
            </div>
        </div>

        <div id="loginFormContainer" class="auth-container glass-card fade-in hidden">
            <button class="back-btn" onclick="showRoles()">← Back to Panels</button>
            <h2 id="loginTitle" class="gradient-text" style="text-align: center; margin-bottom: 30px;">Login</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="••••••••">
                </div>
                <button type="submit">Log In</button>
            <div style="margin-top: 20px; text-align: center;">
                <span style="font-size: 0.85rem; color: var(--text-muted);">Don't have an account? </span>
                <a href="register" style="font-size: 0.85rem; color: var(--secondary); text-decoration: none; font-weight: 600;">Register Now</a>
            </div>
        </form>
            
            <p id="credentialHint" style="margin-top: 30px; font-size: 0.8rem; color: var(--text-muted); text-align: center;">
                <!-- Hints populated by JS -->
            </p>
        </div>
    </div>

    <script>
        const hints = {
            'Admin': 'admin / admin123',
            'Receptionist': 'receptionist / reception123',
            'Patient': 'patient1 / patient123'
        };

        function showLogin(role) {
            document.getElementById('roleSelection').classList.add('hidden');
            document.getElementById('loginFormContainer').classList.remove('hidden');
            document.getElementById('loginTitle').innerText = role + ' Login';
            document.getElementById('credentialHint').innerHTML = 'Credentials: ' + hints[role];
        }

        function showRoles() {
            document.getElementById('roleSelection').classList.remove('hidden');
            document.getElementById('loginFormContainer').classList.add('hidden');
        }

        // Keep form visible if there was an error
        <% if (request.getAttribute("error") != null) { %>
            showLogin('System');
        <% } %>
    </script>
</body>
</html>
