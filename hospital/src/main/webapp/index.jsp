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
    <div class="dashboard-container" style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center;">
        <h1 class="logo gradient-text">HMS</h1>
        <p style="color: var(--text-muted); margin-bottom: 40px; text-align: center;">Your Trusted Healthcare Portal</p>

        <div id="roleSelection" class="grid fade-in">
            <div class="glass-card role-card" onclick="showLogin('Admin')">
                <span class="role-icon">🛡️</span>
                <h3 class="gradient-text">Admin Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">Manage staff and system settings.</p>
            </div>
            <div class="glass-card role-card" onclick="showLogin('Receptionist')">
                <span class="role-icon">📅</span>
                <h3 class="gradient-text">Receptionist Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">Handle bookings and patient records.</p>
            </div>
            <div class="glass-card role-card" onclick="showLogin('Patient')">
                <span class="role-icon">👤</span>
                <h3 class="gradient-text">Patient Panel</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted);">Access your health records and appointments.</p>
            </div>
        </div>

        <div id="loginFormContainer" class="auth-container glass-card fade-in hidden">
            <button class="back-btn" onclick="showRoles()" style="width: auto; background: none; color: var(--text-muted); padding: 5px 10px;">← Back</button>
            <h2 id="loginTitle" class="gradient-text" style="text-align: center; margin-bottom: 25px;">Login</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="badge badge-error" style="display: block; text-align: center; margin-bottom: 20px; padding: 10px;">
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
                    <span style="font-size: 0.85rem; color: var(--text-muted);">New patient? </span>
                    <a href="register" style="font-size: 0.85rem; color: var(--primary); text-decoration: none; font-weight: 700;">Create Account</a>
                </div>
            </form>
            
            <p id="credentialHint" style="margin-top: 30px; font-size: 0.8rem; color: var(--text-muted); text-align: center; font-style: italic;">
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
