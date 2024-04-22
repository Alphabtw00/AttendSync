package com.example.attendsync;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/UpdateAttendanceServlet")
public class UpdateAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AttendanceManager attendanceManager;

    @Override
    public void init() throws ServletException { //at startup it creates a new object which reads students from file name and add default absent to all of them
        attendanceManager = new AttendanceManager();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //sends default attendance info to edit in attendance jsp page
        request.setAttribute("attendanceData", attendanceManager.getAttendanceData());
        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //sends updated attendance to show in display attendance jsp
        for (String parameterName : request.getParameterMap().keySet()) {
            if (!parameterName.equals("submit")) { // Ignore submit button
                String[] parts = parameterName.split("_");
                if (parts.length == 2) {
                    String studentName = parts[0];
                    String dayOfWeek = parts[1];
                    boolean present = request.getParameter(parameterName) != null;
                    attendanceManager.updateAttendance(studentName, dayOfWeek, present);
                }
            }
        }

        // Redirect back to the attendance page with updated data
        request.setAttribute("attendanceData", attendanceManager.getAttendanceData());
        request.getRequestDispatcher("displayAttendance.jsp").forward(request, response);
    }
}
