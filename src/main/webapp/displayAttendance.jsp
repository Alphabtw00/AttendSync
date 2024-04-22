<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Summary</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #343a40;
            color: #fff;
        }

        .table td {
            vertical-align: middle;
        }

        .present {
            color: #28a745;
        }

        .absent {
            color: #dc3545;
        }

        .edit-link {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
        }

        .edit-link:hover {
            color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4 animate__animated animate__bounceIn">Attendance Summary</h2>
    <table class="table table-striped animate__animated animate__fadeInLeft">
        <thead>
        <tr>
            <th>Student Name</th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
        </tr>
        </thead>
        <tbody>
        <%
            HashMap<String, HashMap<String, Boolean>> attendanceData = (HashMap<String, HashMap<String, Boolean>>) request.getAttribute("attendanceData");
            for (Map.Entry<String, HashMap<String, Boolean>> entry : attendanceData.entrySet()) {
                String studentName = entry.getKey();
                HashMap<String, Boolean> studentAttendance = entry.getValue();
        %>
        <tr>
            <td><%= studentName %></td>
            <td><i class="<%= studentAttendance.get("Monday") ? "fas fa-check-circle present" : "fas fa-times-circle absent" %>"></i></td>
            <td><i class="<%= studentAttendance.get("Tuesday") ? "fas fa-check-circle present" : "fas fa-times-circle absent" %>"></i></td>
            <td><i class="<%= studentAttendance.get("Wednesday") ? "fas fa-check-circle present" : "fas fa-times-circle absent" %>"></i></td>
            <td><i class="<%= studentAttendance.get("Thursday") ? "fas fa-check-circle present" : "fas fa-times-circle absent" %>"></i></td>
            <td><i class="<%= studentAttendance.get("Friday") ? "fas fa-check-circle present" : "fas fa-times-circle absent" %>"></i></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="text-center mt-4 animate__animated animate__fadeInUp">
        <a href="UpdateAttendanceServlet" class="edit-link">
            <i class="fas fa-edit"></i> Edit More Attendance
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>