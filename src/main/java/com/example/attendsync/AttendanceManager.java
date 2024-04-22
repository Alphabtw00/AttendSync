package com.example.attendsync;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

public class AttendanceManager {
    private HashMap<String, HashMap<String, Boolean>> attendanceData;

    public AttendanceManager() {
        attendanceData = new HashMap<>();
        this.initializeDataFromFile();
    }

    private void initializeDataFromFile() { //reads students name and add default absent to all of them
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("attendance_data.txt");
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String studentName = line;
                HashMap<String, Boolean> attendance = new HashMap<>();
                // Initialize attendance for all days to false
                attendance.put("Monday", false);
                attendance.put("Tuesday", false);
                attendance.put("Wednesday", false);
                attendance.put("Thursday", false);
                attendance.put("Friday", false);
                attendanceData.put(studentName, attendance);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public HashMap<String, HashMap<String, Boolean>> getAttendanceData() {
        return attendanceData;
    }

    public void updateAttendance(String studentName, String dayOfWeek, boolean present) {
        HashMap<String, Boolean> studentAttendance = attendanceData.get(studentName);
        if (studentAttendance != null) {
            studentAttendance.put(dayOfWeek, present);
        }
    }
}
