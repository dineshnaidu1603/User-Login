<%@ page import="java.sql.SQLException" %>
<%@ page import="cred.login" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <style>
        /* Style the form container */
        form {
            width: 300px;
            margin: 0 auto;
        }

        /* Style form labels */
        label {
            display: block;
            margin-bottom: 5px;
        }

        /* Style form inputs */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Style submit button */
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Change submit button color on hover */
        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Style error message */
        .error {
            color: red;
            font-style: italic;
        }


    </style>
</head>
<body>
<%
    if("post".equalsIgnoreCase(request.getMethod())) {
        int S_num = Integer.parseInt(request.getParameter("S_num"));
        String Name = request.getParameter("Name");
        String Email = request.getParameter("Email");
        String Password = request.getParameter("Password");
        PrintWriter print = response.getWriter();
        try {
            login.insertRecord(S_num, Name, Email, Password);
            print.println("<p>Registration successful!</p>");
        } catch (ClassNotFoundException | SQLException e) {
            print.println("<p>Error during registration: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
 %>
<form action="index.jsp" method="post">
    <label>Serial Number:</label>
    <input type="text" name="S_num"><br><br>
    <label>Name:</label>
    <input type="text" name="Name"><br><br>
    <label>Email:</label>
    <input type="text" name="Email"><br><br>
    <label>Password:</label>
    <input type="password" name="Password"><br><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
