package com.hms.controller;

import com.hms.dao.AppointmentDao;
import com.hms.dao.DoctorDao;
import com.hms.dao.PatientDao;
import com.hms.model.Appointment;
import com.hms.model.Doctor;
import com.hms.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@WebServlet("/appointments")
public class AppointmentServlet extends HttpServlet {
    private AppointmentDao appointmentDao = new AppointmentDao();
    private DoctorDao doctorDao = new DoctorDao();
    private PatientDao patientDao = new PatientDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertAppointment(request, response);
                break;
            case "delete":
                deleteAppointment(request, response);
                break;
            case "updateStatus":
                updateStatus(request, response);
                break;
            default:
                listAppointments(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Appointment> listAppointment = appointmentDao.getAllAppointments();
        request.setAttribute("listAppointment", listAppointment);
        request.getRequestDispatcher("manage_appointments.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Doctor> doctors = doctorDao.getAllDoctors();
        List<Patient> patients = patientDao.getAllPatients();
        request.setAttribute("doctors", doctors);
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("appointment_form.jsp").forward(request, response);
    }

    private void insertAppointment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        Date date = Date.valueOf(request.getParameter("date"));
        Time time = Time.valueOf(request.getParameter("time") + ":00");
        String status = "SCHEDULED";

        Appointment newAppointment = new Appointment(0, patientId, doctorId, date, time, status);
        appointmentDao.addAppointment(newAppointment);
        response.sendRedirect("appointments?action=list");
    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        appointmentDao.updateAppointmentStatus(id, status);
        response.sendRedirect("appointments?action=list");
    }

    private void deleteAppointment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        appointmentDao.deleteAppointment(id);
        response.sendRedirect("appointments?action=list");
    }
}
