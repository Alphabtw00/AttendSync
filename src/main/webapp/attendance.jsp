<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attendance Management System</title>
    <meta charset="UTF-8">
</head>
<body>
<h2>Student Attendance</h2>
<form action="UpdateAttendanceServlet" method="post">
    <table border="1">
        <tr>
            <th>Student ID</th>
            <th>Present</th>
        </tr>
        <%
            // Retrieve attendance data from the AttendanceManager
            HashMap<String, Boolean> attendanceData = (HashMap<String, Boolean>) request.getAttribute("attendanceData");
            System.out.println("attendanceData: " + attendanceData); // Add this line for debugging
            for (Map.Entry<String, Boolean> entry : attendanceData.entrySet()) {
                String studentID = entry.getKey();
                boolean present = entry.getValue();
        %>
        <tr>
            <td><%= studentID %></td>
            <td><input type="checkbox" name="<%= studentID %>" <%= present ? "checked" : "" %>></td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <input type="submit" value="Update Attendance">
</form>
</body>
</html>
