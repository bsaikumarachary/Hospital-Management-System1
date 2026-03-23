package com.hms.controller;

import com.hms.dao.UserDao;
import com.hms.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDao.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect("admin_dashboard.jsp");
            } else if ("RECEPTIONIST".equals(user.getRole())) {
                response.sendRedirect("receptionist_dashboard.jsp");
            } else if ("PATIENT".equals(user.getRole())) {
                response.sendRedirect("patient_dashboard.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
