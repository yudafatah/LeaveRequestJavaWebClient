/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import root.helper.sendMailNotif;
import root.services.EmployeeService;
import root.services.LeaveRequestServices;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "Reject", urlPatterns = {"/reject"})
public class Reject extends HttpServlet {

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
        String id = session.getAttribute("Id").toString();
        String lrid = request.getParameter("lrid");
        String noterej = request.getParameter("noterej");
        String email = session.getAttribute("email").toString();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            LeaveRequestServices lrs = new LeaveRequestServices();
            ArrayList<HashMap<String, String>> lr = lrs.getLRById(lrid);
            String message = lrs.updateLRReject(lrid, noterej);
            EmployeeService es = new EmployeeService();
            ArrayList<HashMap<String, String>> e = es.getEmployeeByEmail(email);
            int thisyear = Integer.parseInt(e.get(0).get("quotaThisyear"))+Integer.parseInt(lr.get(0).get("lrDuration"));
            es.updateEmployeeLRQuota(id, thisyear+"");
            sendMailNotif mailNotif = new sendMailNotif();
            String subject = "Leave Request Rejected";
            String text = "Sorry your leave request from "+lr.get(0).get("startDate")+" until "+lr.get(0).get("endDate")+" has been approved. "
                    + "with reason : " +noterej;
            mailNotif.Send("yudafatah@gmail.com",subject, text);
            session.setAttribute("message", message);
            session.setAttribute("Id", id);
            response.sendRedirect("views/ManagerPage.jsp");
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
