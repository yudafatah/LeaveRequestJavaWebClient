<%-- 
    Document   : navbaremployeeUP
    Created on : Dec 19, 2018, 8:57:42 AM
    Author     : EMDES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand navbar-info bg-dark static-top">
    <a class="navbar-brand mr-1" href="StaffDashboard.jsp">Leave Request</a>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a href="Login.jsp" class="dropdown-item"   onclick="return confirm('Are you sure you want to Logout?')">Logout</a>
            </div>
        </li>
    </ul>
</nav>>
