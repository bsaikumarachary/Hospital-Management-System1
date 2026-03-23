package com.hms.controller;

import com.hms.dao.DoctorDao;
import com.hms.model.Doctor;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/doctors")
public class DoctorServlet extends HttpServlet {
    private DoctorDao doctorDao = new DoctorDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertDoctor(request, response);
                break;
            case "delete":
                deleteDoctor(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateDoctor(request, response);
                break;
            default:
                listDoctors(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listDoctors(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Doctor> listDoctor = doctorDao.getAllDoctors();
        request.setAttribute("listDoctor", listDoctor);
        request.getRequestDispatcher("manage_doctors.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("doctor_form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Doctor existingDoctor = doctorDao.getDoctorById(id);
        request.setAttribute("doctor", existingDoctor);
        request.getRequestDispatcher("doctor_form.jsp").forward(request, response);
    }

    private void insertDoctor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Doctor newDoctor = new Doctor(0, name, specialization, phone, email);
        doctorDao.addDoctor(newDoctor);
        response.sendRedirect("doctors?action=list");
    }

    private void updateDoctor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Doctor doctor = new Doctor(id, name, specialization, phone, email);
        doctorDao.updateDoctor(doctor);
        response.sendRedirect("doctors?action=list");
    }

    private void deleteDoctor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        doctorDao.deleteDoctor(id);
        response.sendRedirect("doctors?action=list");
    }
}
