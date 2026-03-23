package com.hms.dao;

import com.hms.model.Appointment;
import com.hms.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {
    public void addAppointment(Appointment appointment) {
        String query = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, appointment.getPatientId());
            ps.setInt(2, appointment.getDoctorId());
            ps.setDate(3, appointment.getAppointmentDate());
            ps.setTime(4, appointment.getAppointmentTime());
            ps.setString(5, appointment.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        String query = "SELECT a.*, p.name as patient_name, d.name as doctor_name " +
                       "FROM appointments a " +
                       "JOIN patients p ON a.patient_id = p.id " +
                       "JOIN doctors d ON a.doctor_id = d.id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Appointment app = new Appointment(
                    rs.getInt("id"),
                    rs.getInt("patient_id"),
                    rs.getInt("doctor_id"),
                    rs.getDate("appointment_date"),
                    rs.getTime("appointment_time"),
                    rs.getString("status")
                );
                app.setPatientName(rs.getString("patient_name"));
                app.setDoctorName(rs.getString("doctor_name"));
                appointments.add(app);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public void updateAppointmentStatus(int id, String status) {
        String query = "UPDATE appointments SET status=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAppointment(int id) {
        String query = "DELETE FROM appointments WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
