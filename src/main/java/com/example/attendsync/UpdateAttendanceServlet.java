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


    private static final Map<String, Boolean> ATTENDANCE_DATA = new HashMap<>();

    @Override
    public void init() throws ServletException { // read attendance data from file at start up
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("attendance_data.txt");
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    String studentID = parts[0];
                    boolean present = Boolean.parseBoolean(parts[1]);
                    ATTENDANCE_DATA.put(studentID, present);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("attendanceData", ATTENDANCE_DATA);

        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String, Boolean> updatedAttendance = new HashMap<>();
        for (String parameterName : request.getParameterMap().keySet()) {
            if (!parameterName.equals("submit")) { // Ignore submit button
                String studentID = parameterName;
                boolean present = request.getParameter(parameterName) != null;
                updatedAttendance.put(studentID, present);
            }
        }

        for (String studentID : updatedAttendance.keySet()) {
            ATTENDANCE_DATA.put(studentID, updatedAttendance.get(studentID));
        }

        // Redirect back to the attendance page with updated data
        request.setAttribute("attendanceData", ATTENDANCE_DATA);
        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }
}
