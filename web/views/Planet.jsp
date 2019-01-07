<%-- 
    Document   : Planet
    Created on : Dec 16, 2018, 7:39:56 PM
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
            String lrid ="";
            String empid ="";
            String typelr = "";
            String reqdate = "";
            String startdate = "";
            String enddate = "";
            String duration = "";
            String notereq = "";
        if(session.getAttribute("LeaveRequest")!=null){
            ArrayList<HashMap<String, String>> lr = (ArrayList<HashMap<String, String>>) session.getAttribute("LeaveRequest");
         
            lrid = lr.get(0).get("lrId");
            empid = lr.get(0).get("empName");
            typelr = lr.get(0).get("typeLr");
            reqdate = lr.get(0).get("requestDate");
            startdate = lr.get(0).get("startDate");
            enddate = lr.get(0).get("endDate");
            duration = lr.get(0).get("lrDuration");
            notereq = lr.get(0).get("noteRequest");
        }
        %>
        <form method="POST" action="../approve?lrid=<%= lrid %>" >
            <div class="form-group form-inline">
                <label class="control-label col-sm-5" hidden="true">Leave Request Id</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="lrid" value="<%= lrid %>" readonly="true" hidden="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Employee Name</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="empid" value="<%= empid %>" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Leave Request Type</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="typelrid" value="<%= typelr %>" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5" hidden="true">Request Date</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="reqdate" value="<%= reqdate %>" readonly="true" hidden="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Start Date</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="startdate" value="<%= startdate %>" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">End Date</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="enddate" value="<%= enddate %>" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Duration</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="duration" value="<%= duration %> Days" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Note Request</label>
                <div class="col-sm-6">
                    <textarea row="5" class="form-control" name="notereq" value="" readonly="true"><%= notereq %></textarea>
                </div>
            </div>
                <div class="modal-footer" style="text-align: center; ">
                <button type="submit" class="btn btn-success btn-block" onclick="return confirm('Are you sure want to Approve this leave request?');">Approve</button>
            </div>
        </form>
    </body>
</html>
