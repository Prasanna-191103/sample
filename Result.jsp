<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESULTS</title>
</head>
<body style="text-align:center">

<%
    int RegNo = Integer.parseInt(request.getParameter("reg"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");

            String query = "SELECT * FROM RESULT WHERE REG_NO = ?;";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, RegNo);

            ResultSet rs = ps.executeQuery();
            out.println("<h2>Results<h2>");
            while (rs.next()) {
                out.println("<h3>" + rs.getInt("reg_no") + "</h3>");
                Double m1, m2, m3, result;
                m1 = rs.getDouble("mark1");
                m2 = rs.getDouble("mark2");
                m3 = rs.getDouble("mark3");
                result = m1 + m2 + m3;
                out.println("<h3>Mark1: " + m1 + "</h3>");
                out.println("<h3>Mark2: " + m2 + "</h3>");
                out.println("<h3>Mark3: " + m3 + "</h3><hr/>");
                out.println("<h1>Result: " + result + "</h1>");
                out.println("<h1>Percentage: " + result / 3 + "</h1>");

            }
            conn.close();

        } catch (Exception e) {
            out.println("DB Not conneceted.. or Refuese to COnnected");
        }
%>
</body>
</html>