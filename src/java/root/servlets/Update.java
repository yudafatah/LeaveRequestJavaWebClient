/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import root.services.EmployeeService;
import root.services.LeaveRequestServices;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "Update", urlPatterns = {"/update"})
public class Update extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String param = request.getParameter("param");
        String lrid = request.getParameter("lrid");
        String id = session.getAttribute("Id").toString();
        String email = session.getAttribute("email").toString();
        String message = "";
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            LeaveRequestServices lrs = new LeaveRequestServices();
            EmployeeService es = new EmployeeService();
            ArrayList<HashMap<String, String>> lr = lrs.getLRById(lrid);
            ArrayList<HashMap<String, String>> emp = es.getEmployeeByEmail(email);
            // Employee e = (Employee) lri.getByIdObj(new Employee(), lr.getEmployeeId().getEmployeeId());
            int thisyear = Integer.parseInt(lr.get(0).get("lrDuration")) + Integer.parseInt(emp.get(0).get("quotaThisyear"));
            message = lrs.cancelLR(lrid);
            if (message.contains("Data has been canceled")){
                es.updateEmployeeLRQuota(id, thisyear + "");
                session.setAttribute("message", message);
                response.sendRedirect("views/StaffPage.jsp");
            }
            
//                    Employee e1 = new Employee(lr.getEmployeeId().getEmployeeId(), e.getEmployeeName(), 
//                            e.getGender(), e.getAddress(), e.getJoinDate(), e.getEmail(), e.getUsername(), 
//                            thisyear, e.getPassword(), e.getIsActive(), e.getManagerId(), e.getRoleId(), e.getSiteId());
//                    String message = lri.updateObj(lr1);
            

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
