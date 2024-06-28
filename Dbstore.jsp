<%@ page import="java.util.*, java.sql.*" %>
<%
    int RegNo = Integer.parseInt(request.getParameter("reg"));
    Double mark1 = Double.parseDouble(request.getParameter("mark1"));
    Double mark2 = Double.parseDouble(request.getParameter("mark2"));
    Double mark3 = Double.parseDouble(request.getParameter("mark3"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root","root");

        

        String query = "INSERT INTO RESULT(reg_no, mark1, mark2, mark3) VALUES(?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, RegNo);
        ps.setDouble(2,mark1);
        ps.setDouble(3,mark2);
        ps.setDouble(4,mark3);
        ps.executeUpdate();
        conn.close();  
        
    } catch (Exception e) {
    out.println("DB Not conneceted.. or Refuese to COnnected");
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
</head>

<body style="text-align: center;">

    <h1>Thank you for Submitting</h1>
    <hr>
    <p>Form is submitted</p>

</body>

</html>
