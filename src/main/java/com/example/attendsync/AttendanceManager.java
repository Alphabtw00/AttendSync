package com.example.attendsync;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

public class AttendanceManager {
    private HashMap<String, Boolean> attendanceData;

    public AttendanceManager() {
        attendanceData = new HashMap<>();
        // Initialize attendance data from file
        initializeDataFromFile();
    }

    private void initializeDataFromFile() {
        // Initialize attendance data for 5 students
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("attendance_data.txt");
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    String studentID = parts[0];
                    boolean present = Boolean.parseBoolean(parts[1]);
                    attendanceData.put(studentID, present);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Getter method to retrieve attendance data
    public HashMap<String, Boolean> getAttendanceData() {
        return attendanceData;
    }

    // Method to update attendance for a student
    public void updateAttendance(String studentID, boolean present) {
        attendanceData.put(studentID, present);
    }
}
