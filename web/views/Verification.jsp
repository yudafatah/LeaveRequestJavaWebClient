<%-- 
    Document   : Verification
    Created on : Dec 20, 2018, 9:45:31 AM
    Author     : yudafatah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../assets/css/formImg.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String id = "";
            if (session.getAttribute("Id") != null) {
                id = session.getAttribute("Id").toString();
            }
            String x = session.getAttribute("code").toString();
        %>
        <div class="bg-img col-md-4 col-md-offset-4">
            <form method="POST" action="../verify" class="container">
                <h1>Verification Form</h1>
                }
                %>
                <%
                    if (session.getAttribute("message") != null) {
                        String message = session.getAttribute("message").toString();
                %>
                <div class="pesan">
                    <div class="alert alert-warning alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <%= message%>
                    </div>
                </div>
                <%
                    }
                %>
                <label for="email"><b>Verification Code</b></label>
                <input type="text" placeholder="Enter verification code" name="code" required>
                <label for="email"><b>New Password</b></label>
                <input type="text" placeholder="Enter new password" name="psw" required>
                <label for="email"><b>Confirm Password</b></label>
                <input type="text" placeholder="Enter the same password" name="cpsw" required>
                <button type="submit" class="btn">Login</button>
            </form>
        </div>
        <%
            session.setAttribute("code", x);
            session.setAttribute("Id", id);
            %>
        <%
        %>
    </body>
</html>
