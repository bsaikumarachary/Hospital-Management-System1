package com.hms.controller;

import com.hms.dao.PatientDao;
import com.hms.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/patients")
public class PatientServlet extends HttpServlet {
    private PatientDao patientDao = new PatientDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertPatient(request, response);
                break;
            case "delete":
                deletePatient(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updatePatient(request, response);
                break;
            default:
                listPatients(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listPatients(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Patient> listPatient = patientDao.getAllPatients();
        request.setAttribute("listPatient", listPatient);
        request.getRequestDispatcher("manage_patients.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("patient_form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Patient existingPatient = patientDao.getPatientById(id);
        request.setAttribute("patient", existingPatient);
        request.getRequestDispatcher("patient_form.jsp").forward(request, response);
    }

    private void insertPatient(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Patient newPatient = new Patient(0, name, age, gender, phone, address, null);
        patientDao.addPatient(newPatient);
        response.sendRedirect("patients?action=list");
    }

    private void updatePatient(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Patient patient = new Patient(id, name, age, gender, phone, address, null);
        patientDao.updatePatient(patient);
        response.sendRedirect("patients?action=list");
    }

    private void deletePatient(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        patientDao.deletePatient(id);
        response.sendRedirect("patients?action=list");
    }
}
