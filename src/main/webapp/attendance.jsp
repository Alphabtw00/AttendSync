<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management System</title>
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

        .form-check-input:checked {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4 animate__animated animate__bounceIn">Student Attendance</h2>
    <form action="UpdateAttendanceServlet" method="post">
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
                // Retrieve attendance data from the AttendanceManager
                HashMap<String, HashMap<String, Boolean>> attendanceData = (HashMap<String, HashMap<String, Boolean>>) request.getAttribute("attendanceData");
                for (Map.Entry<String, HashMap<String, Boolean>> entry : attendanceData.entrySet()) {
                    String studentName = entry.getKey();
                    HashMap<String, Boolean> studentAttendance = entry.getValue();
            %>
            <tr>
                <td><%= studentName %></td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="<%= studentName %>_Monday" <%= studentAttendance.get("Monday") ? "checked" : "" %>>
                    </div>
                </td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="<%= studentName %>_Tuesday" <%= studentAttendance.get("Tuesday") ? "checked" : "" %>>
                    </div>
                </td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="<%= studentName %>_Wednesday" <%= studentAttendance.get("Wednesday") ? "checked" : "" %>>
                    </div>
                </td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="<%= studentName %>_Thursday" <%= studentAttendance.get("Thursday") ? "checked" : "" %>>
                    </div>
                </td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="<%= studentName %>_Friday" <%= studentAttendance.get("Friday") ? "checked" : "" %>>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <div class="text-center mt-4 animate__animated animate__fadeInUp">
            <button type="submit" class="btn btn-primary"><i class="fas fa-check-circle"></i> Update Attendance</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>