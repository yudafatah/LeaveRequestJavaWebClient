<%-- 
    Document   : PlanetReject
    Created on : Jan 6, 2019, 11:27:37 PM
    Author     : yudafatah
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String lrid = "";
            if (session.getAttribute("LeaveRequest") != null) {
                ArrayList<HashMap<String, String>> lr = (ArrayList<HashMap<String, String>>) session.getAttribute("LeaveRequest");

                lrid = lr.get(0).get("lrId");
            }
        %>
        <form method="POST" action="../reject">
            <div class="col-sm-12">
                <input type="text" class="form-control" name="lrid" value="<%= lrid %>" readonly="true">
            </div>
            <div class="col-sm-12">
                <textarea row="5" class="form-control" name="noterej" value=""></textarea>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning btn-md" onclick="return confirm('Are you sure want to reject this leave request?');" >Reject</button>
            </div>
        </form>
    </body>
</html>
