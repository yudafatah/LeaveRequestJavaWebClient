<%-- 
    Document   : Profile
    Created on : Dec 17, 2018, 3:15:27 AM
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
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel basic-default">
                        <div class="panel-heading">
                            <h3>Profile</h3>
                        </div>
                        <div class="panel-body">
                            <%
                                if (session.getAttribute("message") != null) {
                                    String message = session.getAttribute("message").toString();
                                    if (session.getAttribute("status") != null) {
                                        String status = session.getAttribute("status").toString();
                                        if (status.contains("success")) {
                            %>
                            <div class="pesan">
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <%= message%>
                                </div>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="pesan">
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <%= message%>
                                </div>
                            </div>
                            <%
                                        }
                                    }
                                }
                            %>
                            <form method="POST" action="../editEmp">
                                <div class="form-group">
                                    <label>Name</label>
                                    <%
                                        ArrayList<HashMap<String, String>> emplist = (ArrayList<HashMap<String, String>>) session.getAttribute("empList");
                                        for (int idx = 0; idx < emplist.size(); idx++) {
                                    %>
                                    <input type="text" class="form-control" name="empname" value="<%= emplist.get(idx).get("employeeName")%>">
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                    <input type="text" class="form-control" name="gender" value="<%= emplist.get(idx).get("gender")%>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="notereq">Address</label>
                                    <textarea class="form-control" rows="5" name="address"><%= emplist.get(idx).get("address")%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Join Date</label>
                                    <input type="text" class="form-control" name="joinDate" value="<%= emplist.get(idx).get("joinDate")%>" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email" value="<%= emplist.get(idx).get("email")%>" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" name="phone" value="<%= emplist.get(idx).get("phone")%>">
                                </div>
                                <div class="form-group">
                                    <label>Quota This Year</label>
                                    <input type="text" class="form-control" name="quotathisyear" value="<%= emplist.get(idx).get("quotaThisyear")%>" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Quota Last Year</label>
                                    <input type="text" class="form-control" name="qlastyear" value="<%= emplist.get(idx).get("quotaLastyear")%>" readonly>
                                </div>
                                <button clas type="submit" class="btn btn-info">Submit</button>
                                <%}%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
