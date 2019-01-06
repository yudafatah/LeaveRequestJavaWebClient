F<%-- 
    Document   : nav1
    Created on : Dec 13, 2018, 9:20:14 AM
    Author     : EMDES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="../geatAll?">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../geatAll?param=histories">
            <i class="fas fa-fw fa-book-open"></i>
            <span>History</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-user"></i>
            <span>User</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="../EditData">Edit Profile</a>
            <a href="Login.jsp" class="dropdown-item"   onclick="return confirm('Are you sure you want to Logout?')">Logout</a>
        </div>
    </li>
</ul>