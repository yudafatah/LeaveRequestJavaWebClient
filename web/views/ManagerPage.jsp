<%-- 
    Document   : ManagerPage
    Created on : Dec 13, 2018, 1:26:39 PM
    Author     : yudafatah
--%>


<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>       
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="../assets/css/sb-admin.css" rel="stylesheet">
        <title>Leave Request</title>
    </head>
    <body id="page-top">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="StaffPage.jsp">Leave Request</a>
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
        </nav>
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="ManagerDashboard.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ManagerHistories.jsp">
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

            <div id="content-wrapper">
                <div class="container-fluid">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">On Manager</a>
                        </li>
                        <li class="breadcrumb-item active">List Leave Request</li>
                    </ol>

                    <!-- Icon Cards-->
                    <div class="row">
                        <div id="imgModal" class="modal" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Proof of agreement</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="imageBody">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (session.getAttribute("message") != null) {%>
                        <div class="alert alert-info alert-dismissible fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%= session.getAttribute("message").toString()%> 
                        </div>
                        <%}%>

                        <div class="modal fade" id="RejModal" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Note Rejected</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="rejectBody">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="EditData" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Leave Request Details</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="detail">  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="panel basic-default">
                                <div class="panel-heading">
                                    <h3>List Leave Request</h3><br>
                                </div>
                            </div>

                            <div class="panel basic-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Employee Name</th>
                                                    <th>Request Date</th>
                                                    <th>Start Date</th>
                                                    <th>End Date</th>
                                                    <th>Note Request</th>
                                                    <th>Image</th>
                                                    <th width="145">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int no = 1;
                                                    if (session.getAttribute("lrList") != null && session.getAttribute("lrrList")!=null) {
                                                        ArrayList<HashMap<String, String>> lrList = (ArrayList<HashMap<String, String>>) session.getAttribute("lrList");
                                                        ArrayList<String> lr1 = (ArrayList<String>) session.getAttribute("lrrList");
                                                        for (int idx = 0; idx < lrList.size(); idx++) {
                                                            String mm = lrList.get(idx).get("requestStatus");
                                                            if (mm.contains("Waiting")) {
                                                %>
                                                <tr>
                                                    <td><%= no%></td>
                                                    <td><%= lr1.get(idx)%></td>
                                                    <td><%= lrList.get(idx).get("requestDate")%></td>
                                                    <td><%= lrList.get(idx).get("startDate")%></td>
                                                    <td><%= lrList.get(idx).get("endDate")%></td>
                                                    <td><%= lrList.get(idx).get("noteRequest")%></td>
                                                    <%String img = "/9j/4AAQSkZJRgABAgEASABIAAD/4QyJRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAUAAAAcgEyAAIAAAAUAAAAhodpAAQAAAABAAAAnAAAAMgAAABIAAAAAQAAAEgAAAABQWRvYmUgUGhvdG9zaG9wIDcuMAAyMDA2OjEyOjAyIDIwOjA4OjI2AAAAAAOgAQADAAAAAf//AACgAgAEAAAAAQAAATugAwAEAAAAAQAAAdsAAAAAAAAABgEDAAMAAAABAAYAAAEaAAUAAAABAAABFgEbAAUAAAABAAABHgEoAAMAAAABAAIAAAIBAAQAAAABAAABJgICAAQAAAABAAALWwAAAAAAAABIAAAAAQAAAEgAAAAB/9j/4AAQSkZJRgABAgEASABIAAD/7QAMQWRvYmVfQ00AAv/uAA5BZG9iZQBkgAAAAAH/2wCEAAwICAgJCAwJCQwRCwoLERUPDAwPFRgTExUTExgRDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwBDQsLDQ4NEA4OEBQODg4UFA4ODg4UEQwMDAwMEREMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDP/AABEIAIAAVQMBIgACEQEDEQH/3QAEAAb/xAE/AAABBQEBAQEBAQAAAAAAAAADAAECBAUGBwgJCgsBAAEFAQEBAQEBAAAAAAAAAAEAAgMEBQYHCAkKCxAAAQQBAwIEAgUHBggFAwwzAQACEQMEIRIxBUFRYRMicYEyBhSRobFCIyQVUsFiMzRygtFDByWSU/Dh8WNzNRaisoMmRJNUZEXCo3Q2F9JV4mXys4TD03Xj80YnlKSFtJXE1OT0pbXF1eX1VmZ2hpamtsbW5vY3R1dnd4eXp7fH1+f3EQACAgECBAQDBAUGBwcGBTUBAAIRAyExEgRBUWFxIhMFMoGRFKGxQiPBUtHwMyRi4XKCkkNTFWNzNPElBhaisoMHJjXC0kSTVKMXZEVVNnRl4vKzhMPTdePzRpSkhbSVxNTk9KW1xdXl9VZmdoaWprbG1ub2JzdHV2d3h5ent8f/2gAMAwEAAhEDEQA/AO1+r/ROjX9D6fddgY1ltmNU59j6a3Oc4sbuc97mbnOctD/m90D/AMrcT/tiv/yCh9Wf/E903/wrV/1DVpoACmbLlye5P1y+aXU93P8A+b3QP/KzE/7Yr/8AIJf83ugf+VmJ/wBsV/8AkFoJJUOyz3cn78v8Yuf/AM3ugf8Albif9sV/+QS/5vdA/wDK3E/7Yr/8gtBJKh2V7uT9+X+MXP8A+b3QP/K3E/7Yr/8AIJf83+g/+VuJ/wBsV/8AkFoJJUOyvdyfvy/xi5//ADf6D/5W4n/bFf8A5BL/AJv9B/8AK3E/7Yr/APILQSRoK93J+/L/ABi4tnQ+iDqmPWOn4oY6i9zmejXBLX4oa4t2bfbvekr1v/K+N/4XyP8Aq8NJNrX6/sbXuT9r55fzPf8A8qX/0PQvqz/4nem/+Fav+oatNZn1Z/8AE903/wAK1f8AUNWmkNmTN/Oz/vS/NSSSSTGpJJJJSkkkklKSSSSU07f+V8b/AML5H/V4aSVv/K+N/wCF8j/q8NJDr9f2Nr/Jf9R/9+n/0fQvqz/4nemf+Faf+oatNZn1Z/8AE70z/wAK0/8AUNWmkNmTN/Oz/vS/N8+xPr79YLMql91OGcGzqVvTnNY2wXRWBZ6rXOtfV/Nvb+b9P/Rqz9WPrz1fqvVOn4+bj47cbq1N1+P6O8WVCl9tW251jnsv3fZ3fzbKVnYv1R+sTG4zX4e3b1y/MefUqO3HtZVUzI0t93D/ANE39N/waJ9Ufqt9Y8LrPSX5+GMbH6Rj5FL7/VreLTbZdaz0a6nOtb/Sf8Kxn0P+tpnqvquIhR2YdW+s2X0f6y9ZfgY1H2gX4eObbXXvDm3Vl3vq+0ehXscxv8xTX/bVvG+u31kGbj05VOEaT1c9GyPSFoeXAt/T073uYxjd35/qer/wKp/WH6p/WLM671PLxsM2UZOXg20v9Spu5lDHNvdtfa17djv3lY/5r9e+2Ns+yewfWZ3UifUq/oh27cn+c8v5n+f/AOCS1sq9FDbZTfr/ANfpvoObh41bM1mW6rCixmTR9ma6zHOb6p+hk7Pb+r0/o/0jFXt/xjfWLDx23ZWPh2m/prM+kVC1sG230Km2+pZZ/N+/1GM/nP8ATMVGv6pfWcfZnZfTm1XY/wBudn9UtyKT63r1vbRbfZvOR6eP/wAL/pfzFmUYmf8AWB7em9Prrfl4XRqscCu6u1jjTc22ftFLnUVPt9X9HVZZ+Z+kQJl4pEYeHi+k/Vfr3UepZvVendRbjm/pdlbPXxdwreLWufpXa617fT2f6VdCuW+pnSeo4OX1bKy8GvpeNlvq+x4TDU4sbW1/qS7E/R7XPs9nvXUp421YpVejTt/5Yxv/AAvkf9XhpJW/8sY3/hfI/wCrw0kuv1/Y2P8AJf8AUf8A36f/0vQvqz/4nemf+Faf+oatNZn1Z/8AE70z/wAK0/8AUNWmgNmTN/Oz/vS/NSS84s+tP1np6/Tj5eYzHdl9ROG3pPpVksxbNtWP1H1vfdu9S39HXb/OvZ/oVLo/1s+sWW/omK6/18wjqR6lU1lYNpxt32Ks7ax6P6Rvp/ofS3ocQR7Zq9H0N72MaXPcGtHLiYATMtqeSGPa4tiQ0gxOrZheS5n1o+sFmLl9P6nlU5/q4LrsnHfTSW42RXZP2Uitr2WurbWze27/AEn+krROkZvVMR3Vbul2V4Ruu6SzNyhXXsxsZ2PY67KbTZsx2Mqdtbs/63Wlxi0+0auw+rPfUCK3uaC+Q1pIl3jDfzlGsY1TvRrDK3kbvTbAJHG7aF5S7qnUuuZnQrn5jTmY+V1GjG6k2psuZVXRkUZDsX20b31v2qsPrL1V2VV9YnFj+qN6K8Nt2AAu+1OxmXekPZ6mx/7vpep/g/zEuMK9o932RJch9SuvdQzuqdT6blZ9fVqcNuPbj51ba2bvVZuuqjF/QubVZ+j/AK7LP+t9enA2skKNNO3/AJYxv/C2R/1eGklb/wAsY3/hfI/6vDSQ6/X9jZ/yX/Uf/fp//9P0L6s/+J3pn/hWn/qGrTWZ9WP/ABOdM/8ACtP/AFDVppDZkzfzs/70vzfPsb6ifWCnOpl+G7Fp6z+1jeX2eu9hLZq2ei5m702/nXfzv+EVnp31D6ji9f6v1B91DcbOqy68TYXmxjsp4sY6xmytjfSZv/m7V3CSHCEe5J8yb/i5+sr8aql78Gv7PgWYDNtlp3F1ll7b3/qzdu71fcrP/MDr9c2sdh22My+nZddTn2bH/YqbMe6q13oe3fY/9H7bP0f7i9ESQ4Qr3JPntP1G+suPZjZbHYLsjHy87LNRstDCMxlNTK2u9Dd+j2W/+BKuP8WPWfsjcY5eNp012IXjf/POvOY0bdn9H+jV6/8AOf4T7N/g16UklwhXuSeb+rHQur4PUM/qPU30sOY2murDxnOfVWKWek54NrKvdd9Paxi6RJJOApaTZstO3/ljG/8AC+R/1eGkmt/5Yxf/AAtkf9XhpIdfr+xsf5L/AKj/AO/L/9T0H6sf+Jzpn/hWn/qGrUWX9V//ABOdM/8ACtP/AFDVqIDYL8v85P8AvS/NSSSSKxSSSSSlJJJJKUkkkkppW/8ALGL/AOFsj/q8NJK3/ljF/wDC2R/1eGkm9fr+xs/5L/qP/vy//9X0H6sf+Jzpn/hWn/qGrUWX9WP/ABOdM/8ACtP/AFDVqIDYL8385P8AvS/NSSSSKxSSSSSlJJJJKUkkkkppW/8ALGL/AOFsj/q8NJK3/ljF/wDC2R/1eGkm9fr/ANy2v8l/1H/36f/W9B+rH/ic6Z/4Vp/6hq1Fg/V3qvS6egdOqtzMeuxmNUHsdawEEMb7XNLvatH9tdG/7n43/bzP/JIAigzZcc/cn6T80uni3UlS/bfRv+5+N/29X/5NL9tdG/7n43/bzP8AySVjux+3P92X2N1JUv210f8A7n43/bzP/JJftro3/c/G/wC3mf8AkkrHdXtz/dl9jdSVL9t9G/7n43/bzP8AyaX7b6N/3Pxv+3mf+SSsd1e3P92X2N1JUv230b/ufjf9vM/8ml+2+jf9z8b/ALeZ/wCSSsd1e3P92X2Kt/5Yxf8Awtkf9XhpKpb1fpJ6rjWDNx9jce9pd6rIBL8Ta3du/O2OSQsX9f8AuW1wS9r5T/M1t/5Uv//Z/+0RUFBob3Rvc2hvcCAzLjAAOEJJTQQlAAAAAAAQAAAAAAAAAAAAAAAAAAAAADhCSU0D7QAAAAAAEABIAAAAAQACAEgAAAABAAI4QklNBCYAAAAAAA4AAAAAAAAAAAAAP4AAADhCSU0EDQAAAAAABAAAAB44QklNBBkAAAAAAAQAAAAeOEJJTQPzAAAAAAAJAAAAAAAAAAABADhCSU0ECgAAAAAAAQAAOEJJTScQAAAAAAAKAAEAAAAAAAAAAjhCSU0D9QAAAAAASAAvZmYAAQBsZmYABgAAAAAAAQAvZmYAAQChmZoABgAAAAAAAQAyAAAAAQBaAAAABgAAAAAAAQA1AAAAAQAtAAAABgAAAAAAAThCSU0D+AAAAAAAcAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAA4QklNBAAAAAAAAAIAAjhCSU0EAgAAAAAABgAAAAAAADhCSU0ECAAAAAAAEAAAAAEAAAJAAAACQAAAAAA4QklNBB4AAAAAAAQAAAAAOEJJTQQaAAAAAANTAAAABgAAAAAAAAAAAAAB2wAAATsAAAAPAGQAZQBhAHQAaAAtAGkAbgAtAHYAZQBuAGkAYwBlAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAE7AAAB2wAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAABAAAAABAAAAAAAAbnVsbAAAAAIAAAAGYm91bmRzT2JqYwAAAAEAAAAAAABSY3QxAAAABAAAAABUb3AgbG9uZwAAAAAAAAAATGVmdGxvbmcAAAAAAAAAAEJ0b21sb25nAAAB2wAAAABSZ2h0bG9uZwAAATsAAAAGc2xpY2VzVmxMcwAAAAFPYmpjAAAAAQAAAAAABXNsaWNlAAAAEgAAAAdzbGljZUlEbG9uZwAAAAAAAAAHZ3JvdXBJRGxvbmcAAAAAAAAABm9yaWdpbmVudW0AAAAMRVNsaWNlT3JpZ2luAAAADWF1dG9HZW5lcmF0ZWQAAAAAVHlwZWVudW0AAAAKRVNsaWNlVHlwZQAAAABJbWcgAAAABmJvdW5kc09iamMAAAABAAAAAAAAUmN0MQAAAAQAAAAAVG9wIGxvbmcAAAAAAAAAAExlZnRsb25nAAAAAAAAAABCdG9tbG9uZwAAAdsAAAAAUmdodGxvbmcAAAE7AAAAA3VybFRFWFQAAAABAAAAAAAAbnVsbFRFWFQAAAABAAAAAAAATXNnZVRFWFQAAAABAAAAAAAGYWx0VGFnVEVYVAAAAAEAAAAAAA5jZWxsVGV4dElzSFRNTGJvb2wBAAAACGNlbGxUZXh0VEVYVAAAAAEAAAAAAAlob3J6QWxpZ25lbnVtAAAAD0VTbGljZUhvcnpBbGlnbgAAAAdkZWZhdWx0AAAACXZlcnRBbGlnbmVudW0AAAAPRVNsaWNlVmVydEFsaWduAAAAB2RlZmF1bHQAAAALYmdDb2xvclR5cGVlbnVtAAAAEUVTbGljZUJHQ29sb3JUeXBlAAAAAE5vbmUAAAAJdG9wT3V0c2V0bG9uZwAAAAAAAAAKbGVmdE91dHNldGxvbmcAAAAAAAAADGJvdHRvbU91dHNldGxvbmcAAAAAAAAAC3JpZ2h0T3V0c2V0bG9uZwAAAAAAOEJJTQQRAAAAAAABAQA4QklNBBQAAAAAAAQAAAADOEJJTQQMAAAAAAt3AAAAAQAAAFUAAACAAAABAAAAgAAAAAtbABgAAf/Y/+AAEEpGSUYAAQIBAEgASAAA/+0ADEFkb2JlX0NNAAL/7gAOQWRvYmUAZIAAAAAB/9sAhAAMCAgICQgMCQkMEQsKCxEVDwwMDxUYExMVExMYEQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMAQ0LCw0ODRAODhAUDg4OFBQODg4OFBEMDAwMDBERDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCACAAFUDASIAAhEBAxEB/90ABAAG/8QBPwAAAQUBAQEBAQEAAAAAAAAAAwABAgQFBgcICQoLAQABBQEBAQEBAQAAAAAAAAABAAIDBAUGBwgJCgsQAAEEAQMCBAIFBwYIBQMMMwEAAhEDBCESMQVBUWETInGBMgYUkaGxQiMkFVLBYjM0coLRQwclklPw4fFjczUWorKDJkSTVGRFwqN0NhfSVeJl8rOEw9N14/NGJ5SkhbSVxNTk9KW1xdXl9VZmdoaWprbG1ub2N0dXZ3eHl6e3x9fn9xEAAgIBAgQEAwQFBgcHBgU1AQACEQMhMRIEQVFhcSITBTKBkRShsUIjwVLR8DMkYuFygpJDUxVjczTxJQYWorKDByY1wtJEk1SjF2RFVTZ0ZeLys4TD03Xj80aUpIW0lcTU5PSltcXV5fVWZnaGlqa2xtbm9ic3R1dnd4eXp7fH/9oADAMBAAIRAxEAPwDtfq/0To1/Q+n3XYGNZbZjVOfY+mtznOLG7nPe5m5znLQ/5vdA/wDK3E/7Yr/8gofVn/xPdN/8K1f9Q1aaAApmy5cnuT9cvml1Pdz/APm90D/ysxP+2K//ACCX/N7oH/lZif8AbFf/AJBaCSVDss93J+/L/GLn/wDN7oH/AJW4n/bFf/kEv+b3QP8AytxP+2K//ILQSSodle7k/fl/jFz/APm90D/ytxP+2K//ACCX/N/oP/lbif8AbFf/AJBaCSVDsr3cn78v8Yuf/wA3+g/+VuJ/2xX/AOQS/wCb/Qf/ACtxP+2K/wDyC0EkaCvdyfvy/wAYuLZ0Pog6pj1jp+KGOovc5no1wS1+KGuLdm3273pK9b/yvjf+F8j/AKvDSTa1+v7G17k/a+eX8z3/APKl/9D0L6s/+J3pv/hWr/qGrTWZ9Wf/ABPdN/8ACtX/AFDVppDZkzfzs/70vzUkkkkxqSSSSUpJJJJSkkkklNO3/lfG/wDC+R/1eGklb/yvjf8AhfI/6vDSQ6/X9ja/yX/Uf/fp/9H0L6s/+J3pn/hWn/qGrTWZ9Wf/ABO9M/8ACtP/AFDVppDZkzfzs/70vzfPsT6+/WCzKpfdThnBs6lb05zWNsF0VgWeq1zrX1fzb2/m/T/0as/Vj689X6r1Tp+Pm4+O3G6tTdfj+jvFlQpfbVtudY57L932d382ylZ2L9UfrExuM1+Ht29cvzHn1Kjtx7WVVMyNLfdw/wDRN/Tf8GifVH6rfWPC6z0l+fhjGx+kY+RS+/1a3i022XWs9GupzrW/0n/CsZ9D/raZ6r6riIUdmHVvrNl9H+svWX4GNR9oF+Hjm2117w5t1Zd76vtHoV7HMb/MU1/21bxvrt9ZBm49OVThGk9XPRsj0haHlwLf09O97mMY3d+f6nq/8Cqf1h+qf1izOu9Ty8bDNlGTl4NtL/UqbuZQxzb3bX2te3Y795WP+a/XvtjbPsnsH1md1In1Kv6Idu3J/nPL+Z/n/wDgktbKvRQ22U36/wDX6b6Dm4eNWzNZluqwosZk0fZmusxzm+qfoZOz2/q9P6P9IxV7f8Y31iw8dt2Vj4dpv6azPpFQtbBtt9CptvqWWfzfv9RjP5z/AEzFRr+qX1nH2Z2X05tV2P8AbnZ/VLcik+t69b20W32bzkenj/8AC/6X8xZlGJn/AFge3pvT6635eF0arHArurtY403Ntn7RS51FT7fV/R1WWfmfpECZeKRGHh4vpP1X691HqWb1Xp3UW45v6XZWz18XcK3i1rn6V2ute309n+lXQrlvqZ0nqODl9WysvBr6XjZb6vseEw1OLG1tf6kuxP0e1z7PZ711KeNtWKVXo07f+WMb/wAL5H/V4aSVv/LGN/4XyP8Aq8NJLr9f2Nj/ACX/AFH/AN+n/9L0L6s/+J3pn/hWn/qGrTWZ9Wf/ABO9M/8ACtP/AFDVpoDZkzfzs/70vzUkvOLPrT9Z6ev04+XmMx3ZfUTht6T6VZLMWzbVj9R9b33bvUt/R12/zr2f6FS6P9bPrFlv6Jiuv9fMI6kepVNZWDacbd9irO2sej+kb6f6H0t6HEEe2avR9De9jGlz3BrRy4mAEzLankhj2uLYkNIMTq2YXkuZ9aPrBZi5fT+p5VOf6uC67Jx300luNkV2T9lIra9lrq21s3tu/wBJ/pK0TpGb1TEd1W7pdleEbrukszcoV17MbGdj2Ouym02bMdjKnbW7P+t1pcYtPtGrsPqz31Ait7mgvkNaSJd4w385RrGNU70awyt5G702wCRxu2heUu6p1LrmZ0K5+Y05mPldRoxupNqbLmVV0ZFGQ7F9tG99b9qrD6y9VdlVfWJxY/qjeivDbdgALvtTsZl3pD2epsf+76Xqf4P8xLjCvaPd9kSXIfUrr3UM7qnU+m5WfX1anDbj24+dW2tm71Wbrqoxf0Lm1Wfo/wCuyz/rfXpwNrJCjTTt/wCWMb/wtkf9XhpJW/8ALGN/4XyP+rw0kOv1/Y2f8l/1H/36f//T9C+rP/id6Z/4Vp/6hq01mfVj/wATnTP/AArT/wBQ1aaQ2ZM387P+9L83z7G+on1gpzqZfhuxaes/tY3l9nrvYS2atnouZu9Nv51387/hFZ6d9Q+o4vX+r9QfdQ3GzqsuvE2F5sY7KeLGOsZsrY30mb/5u1dwkhwhHuSfMm/4ufrK/Gqpe/Br+z4FmAzbZadxdZZe29/6s3bu9X3Kz/zA6/XNrHYdtjMvp2XXU59mx/2KmzHuqtd6Ht32P/R+2z9H+4vREkOEK9yT57T9RvrLj2Y2Wx2C7Ix8vOyzUbLQwjMZTUytrvQ3fo9lv/gSrj/Fj1n7I3GOXjadNdiF43/zzrzmNG3Z/R/o1ev/ADn+E+zf4NelJJcIV7knm/qx0Lq+D1DP6j1N9LDmNprqw8Zzn1VilnpOeDayr3XfT2sYukSSTgKWk2bLTt/5Yxv/AAvkf9XhpJrf+WMX/wALZH/V4aSHX6/sbH+S/wCo/wDvy//U9B+rH/ic6Z/4Vp/6hq1Fl/Vf/wATnTP/AArT/wBQ1aiA2C/L/OT/AL0vzUkkkisUkkkkpSSSSSlJJJJKaVv/ACxi/wDhbI/6vDSSt/5Yxf8Awtkf9XhpJvX6/sbP+S/6j/78v//V9B+rH/ic6Z/4Vp/6hq1Fl/Vj/wATnTP/AArT/wBQ1aiA2C/N/OT/AL0vzUkkkisUkkkkpSSSSSlJJJJKaVv/ACxi/wDhbI/6vDSSt/5Yxf8Awtkf9XhpJvX6/wDctr/Jf9R/9+n/1vQfqx/4nOmf+Faf+oatRYP1d6r0unoHTqrczHrsZjVB7HWsBBDG+1zS72rR/bXRv+5+N/28z/ySAIoM2XHP3J+k/NLp4t1JUv230b/ufjf9vV/+TS/bXRv+5+N/28z/AMklY7sftz/dl9jdSVL9tdH/AO5+N/28z/ySX7a6N/3Pxv8At5n/AJJKx3V7c/3ZfY3UlS/bfRv+5+N/28z/AMml+2+jf9z8b/t5n/kkrHdXtz/dl9jdSVL9t9G/7n43/bzP/Jpftvo3/c/G/wC3mf8AkkrHdXtz/dl9irf+WMX/AMLZH/V4aSqW9X6Seq41gzcfY3HvaXeqyAS/E2t3bvztjkkLF/X/ALltcEva+U/zNbf+VL//2QA4QklNBCEAAAAAAFUAAAABAQAAAA8AQQBkAG8AYgBlACAAUABoAG8AdABvAHMAaABvAHAAAAATAEEAZABvAGIAZQAgAFAAaABvAHQAbwBzAGgAbwBwACAANwAuADAAAAABADhCSU0EBgAAAAAAB///AAAAAQEA/+ESSGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSfvu78nIGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4KPD9hZG9iZS14YXAtZmlsdGVycyBlc2M9IkNSIj8+Cjx4OnhhcG1ldGEgeG1sbnM6eD0nYWRvYmU6bnM6bWV0YS8nIHg6eGFwdGs9J1hNUCB0b29sa2l0IDIuOC4yLTMzLCBmcmFtZXdvcmsgMS41Jz4KPHJkZjpSREYgeG1sbnM6cmRmPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJyB4bWxuczppWD0naHR0cDovL25zLmFkb2JlLmNvbS9pWC8xLjAvJz4KCiA8cmRmOkRlc2NyaXB0aW9uIGFib3V0PSd1dWlkOmMwNGRkMTgzLTgyM2YtMTFkYi04ZWYyLWYzOWE3OTdlNDkxMicKICB4bWxuczp4YXBNTT0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyc+CiAgPHhhcE1NOkRvY3VtZW50SUQ+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmMwNGRkMTdmLTgyM2YtMTFkYi04ZWYyLWYzOWE3OTdlNDkxMjwveGFwTU06RG9jdW1lbnRJRD4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKPC9yZGY6UkRGPgo8L3g6eGFwbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9J3cnPz7/7gAOQWRvYmUAZIAAAAAB/9sAhAASDg4OEA4VEBAVHhMREx4jGhUVGiMiFxcXFxciEQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMARQTExYZFhsXFxsUDg4OFBQODg4OFBEMDAwMDBERDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCAHbATsDASIAAhEBAxEB/90ABAAU/8QBPwAAAQUBAQEBAQEAAAAAAAAAAwABAgQFBgcICQoLAQABBQEBAQEBAQAAAAAAAAABAAIDBAUGBwgJCgsQAAEEAQMCBAIFBwYIBQMM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";
                                                        if (!lrList.get(idx).get("image").equals("x")) {
                                                            byte[] bimg = lrList.get(idx).get("image").getBytes();
                                                            img = new String(bimg);
                                                        }
                                                    %>
                                                    <td>
                                                        <a class="btn" id="imagesbtn" data-toggle="modal" value="<%= lrList.get(idx).get("lrId")%>" >
                                                            <img style="width:100%;max-width:120px" id="myImg" src="data:image/jpg;base64, <%= img%> ">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-info btn-md" id="Approve" data-toggle="modal" value="<%= lrList.get(idx).get("lrId")%>" >Approve</a>
                                                        <a class="btn btn-warning btn-md" id="Reject" data-toggle="modal" value="<%= lrList.get(idx).get("lrId")%>" >Reject</a>
                                                        
                                                    </td>
                                                </tr>
                                                <%
                                                            no++;
                                                        }
                                                    }
                                                } else {
                                                %>
                                                <tr><td>Data Empty</td></tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
    </body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id="Approve"]').click(function () {
                var id = $(this).attr('value');
                $.get("../temporary?lrid=" + id, function (result, status) {
                    $("#detail").html(result);
                    $('#EditData').modal('show');
                });
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id="Reject"]').click(function () {
                var id = $(this).attr('value');
                $.get("../tempReject?lrid=" + id, function (result, status) {
                    $("#rejectBody").html(result);
                    $('#RejModal').modal('show');
                });
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id="imagesbtn"]').click(function () {
                var id = $(this).attr('value');
                $.get("../tempImages?lrid=" + id, function (result, status) {
                    $("#imageBody").html(result);
                    $('#imgModal').modal('show');
                });
            });
        });
    </script>

    <%  session.removeAttribute("category");
        session.removeAttribute("message");
    %>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../assets/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../assets/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="../assets/js/sb-admin.min.js"></script>
    <script src="../assets/js/demo/datatables-demo.js"></script>
</html>
